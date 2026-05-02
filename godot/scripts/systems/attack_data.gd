class_name AttackData
extends Resource

## Attack data resource for character moves

@export var attack_name: String = ""
@export var startup_frames: int = 0
@export var active_frames: int = 0
@export var recovery_frames: int = 0
@export var base_damage: float = 0.0
@export var base_knockback: float = 100.0
@export var knockback_angle: float = 45.0
@export var knockback_scaling: float = 1.0
@export var kindle_gain: float = 0.0
@export var kindle_cost: float = 0.0
@export var hitbox_offset: Vector2 = Vector2.ZERO
@export var hitbox_size: Vector2 = Vector2(40, 40)
