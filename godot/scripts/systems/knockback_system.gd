class_name KnockbackSystem
extends Node

## Knockback calculation system
## Uses percentage-based scaling with Inner Core multiplier

func calculate_knockback(
	base_knockback: float,
	total_damage: float,
	kb_scaling: float,
	kb_multiplier: float,
	weight_modifier: float = 1.0
) -> float:
	var damage_kb = total_damage * kb_scaling
	var scaled_kb = (base_knockback + damage_kb) * kb_multiplier
	return scaled_kb * (1.0 / weight_modifier)

func apply_knockback(
	body: CharacterBody2D,
	knockback_force: float,
	angle_degrees: float
) -> void:
	var angle_rad = deg_to_rad(angle_degrees)
	var velocity = Vector2(
		cos(angle_rad) * knockback_force,
		-sin(angle_rad) * knockback_force
	)
	body.velocity = velocity
