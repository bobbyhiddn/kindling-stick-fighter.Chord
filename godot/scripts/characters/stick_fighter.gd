class_name StickFighter
extends CharacterBody2D

## Base stick fighter character with movement and combat

# Physics constants
const WALK_SPEED: float = 300.0
const RUN_SPEED: float = 500.0
const GRAVITY: float = 1800.0
const JUMP_VELOCITY: float = -600.0
const DOUBLE_JUMP_VELOCITY: float = -550.0
const FAST_FALL_MULTIPLIER: float = 2.0

# Player ID
@export var player_id: int = 1

# State variables
var facing_right: bool = true
var can_double_jump: bool = false
var is_fast_falling: bool = false
var hitstun_frames: int = 0
var attack_frames: int = 0
var current_attack: AttackData = null

# Systems
var core_health: CoreHealth
var kindle_system: KindleSystem
var hitbox_manager: HitboxManager

# Input prefix
var input_prefix: String

# Attack data
@export var basic_attack: AttackData

signal player_ignited(player_id: int)

func _ready() -> void:
	# Setup input prefix
	input_prefix = "p%d_" % player_id
	
	# Create systems
	core_health = CoreHealth.new()
	kindle_system = KindleSystem.new()
	add_child(core_health)
	add_child(kindle_system)
	
	# Find or create hitbox manager
	hitbox_manager = get_tree().get_first_node_in_group("hitbox_manager")
	if not hitbox_manager:
		hitbox_manager = HitboxManager.new()
		hitbox_manager.add_to_group("hitbox_manager")
		get_tree().root.add_child(hitbox_manager)
	
	# Load default attack if not set
	if not basic_attack:
		basic_attack = load("res://resources/attacks/jab1.tres")
	
	# Connect signals
	core_health.ignited.connect(_on_ignited)

func _physics_process(delta: float) -> void:
	# Handle attack frames
	if attack_frames > 0:
		attack_frames -= 1
		if attack_frames <= 0:
			current_attack = null
		# Reduced movement during attack
		velocity.x = move_toward(velocity.x, 0, 20)
		move_and_slide()
		return
	
	# Handle hitstun
	if hitstun_frames > 0:
		hitstun_frames -= 1
		move_and_slide()
		return
	
	# Apply gravity
	if not is_on_floor():
		var gravity_mult = FAST_FALL_MULTIPLIER if is_fast_falling else 1.0
		velocity.y += GRAVITY * delta * gravity_mult
	else:
		can_double_jump = true
		is_fast_falling = false
	
	# Handle movement
	handle_movement()
	
	# Handle attacks
	handle_attacks()
	
	# Move
	move_and_slide()

func handle_movement() -> void:
	# Horizontal movement
	var input_dir = 0.0
	if Input.is_action_pressed(input_prefix + "left"):
		input_dir -= 1.0
	if Input.is_action_pressed(input_prefix + "right"):
		input_dir += 1.0
	
	# Determine speed (run vs walk)
	var speed = RUN_SPEED if abs(input_dir) > 0.5 else WALK_SPEED
	
	if input_dir != 0:
		velocity.x = input_dir * speed
		facing_right = input_dir > 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed * 0.1)
	
	# Update sprite direction
	if facing_right:
		scale.x = abs(scale.x)
	else:
		scale.x = -abs(scale.x)
	
	# Jump
	if Input.is_action_just_pressed(input_prefix + "jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif can_double_jump:
			velocity.y = DOUBLE_JUMP_VELOCITY
			can_double_jump = false
	
	# Fast fall
	if Input.is_action_pressed(input_prefix + "down") and not is_on_floor() and velocity.y > 0:
		is_fast_falling = true

func take_hit(attack: AttackData, attacker_facing_right: bool) -> void:
	# Apply damage
	core_health.take_damage(attack.base_damage)
	
	# Grant kindle to both players
	kindle_system.add_kindle(attack.kindle_gain * 0.5)  # Defender gets some
	
	# Calculate knockback using static method
	var knockback_force = KnockbackSystem.calculate_knockback(
		attack.base_knockback,
		core_health.total_damage,
		attack.knockback_scaling,
		core_health.get_kb_multiplier()
	)
	
	# Apply knockback
	var kb_angle = attack.knockback_angle
	if not attacker_facing_right:
		kb_angle = 180.0 - kb_angle
	
	KnockbackSystem.apply_knockback(self, knockback_force, kb_angle)
	
	# Set hitstun
	hitstun_frames = 10 + int(attack.base_damage)

func handle_attacks() -> void:
	# Basic attack
	if Input.is_action_just_pressed(input_prefix + "attack") and basic_attack:
		perform_attack(basic_attack)

const PHYSICS_FPS: float = 60.0  # Godot's default physics FPS

func perform_attack(attack: AttackData) -> void:
	# Check kindle cost
	if attack.kindle_cost > 0:
		if not kindle_system.spend_kindle(attack.kindle_cost):
			return  # Not enough kindle
	
	# Set attack state
	current_attack = attack
	attack_frames = attack.startup_frames + attack.active_frames + attack.recovery_frames
	
	# Activate hitbox after startup frames
	if hitbox_manager:
		await get_tree().create_timer(attack.startup_frames / PHYSICS_FPS).timeout
		if current_attack == attack:  # Still in same attack
			hitbox_manager.activate_hitbox(self, attack, attack.active_frames)

func _on_ignited() -> void:
	player_ignited.emit(player_id)
