class_name HitboxManager
extends Node

## Manages hitbox activation and detection for attacks

signal hit_connected(attacker: StickFighter, defender: StickFighter, attack: AttackData)

var active_hitboxes: Array[Dictionary] = []

func activate_hitbox(
	owner_fighter: StickFighter,
	attack: AttackData,
	duration_frames: int
) -> void:
	var hitbox = {
		"owner": owner_fighter,
		"attack": attack,
		"frames_remaining": duration_frames,
		"hit_targets": []
	}
	active_hitboxes.append(hitbox)

func _physics_process(_delta: float) -> void:
	# Update active hitboxes
	var i = active_hitboxes.size() - 1
	while i >= 0:
		var hitbox = active_hitboxes[i]
		hitbox.frames_remaining -= 1
		
		if hitbox.frames_remaining <= 0:
			active_hitboxes.remove_at(i)
		else:
			# Check for hits
			check_hitbox_collision(hitbox)
		
		i -= 1

func check_hitbox_collision(hitbox: Dictionary) -> void:
	var owner_fighter: StickFighter = hitbox.owner
	var attack: AttackData = hitbox.attack
	
	# Get all players
	var players = get_tree().get_nodes_in_group("players")
	
	for player in players:
		if player == owner_fighter or player in hitbox.hit_targets:
			continue
		
		if player is StickFighter:
			# Simple distance-based collision check
			var hitbox_pos = owner_fighter.global_position + attack.hitbox_offset
			if owner_fighter.facing_right:
				hitbox_pos.x = owner_fighter.global_position.x + attack.hitbox_offset.x
			else:
				hitbox_pos.x = owner_fighter.global_position.x - attack.hitbox_offset.x
			
			var distance = hitbox_pos.distance_to(player.global_position)
			var hit_range = (attack.hitbox_size.x + attack.hitbox_size.y) / 2.0
			
			if distance < hit_range:
				# Hit detected!
				player.take_hit(attack, owner_fighter.facing_right)
				
				# Grant kindle to attacker
				owner_fighter.kindle_system.add_kindle(attack.kindle_gain)
				
				# Mark as hit
				hitbox.hit_targets.append(player)
				
				# Emit signal
				hit_connected.emit(owner_fighter, player, attack)
