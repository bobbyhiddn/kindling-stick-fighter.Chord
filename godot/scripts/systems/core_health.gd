class_name CoreHealth
extends Node

## Two-tiered health system for Kindling
## Outer Core and Inner Core with damage-based knockback scaling

const OUTER_MAX: float = 50.0
const INNER_MAX: float = 50.0
const INNER_KB_MULT: float = 1.5

var outer_core: float = OUTER_MAX
var inner_core: float = INNER_MAX
var total_damage: float = 0.0

signal health_changed(outer: float, inner: float, total: float)
signal inner_core_exposed()
signal ignited()

func _ready() -> void:
	reset()

func reset() -> void:
	outer_core = OUTER_MAX
	inner_core = INNER_MAX
	total_damage = 0.0
	health_changed.emit(outer_core, inner_core, total_damage)

func take_damage(amount: float) -> void:
	total_damage += amount
	
	if outer_core > 0:
		var overflow = max(0, amount - outer_core)
		outer_core = max(0, outer_core - amount)
		if overflow > 0:
			inner_core = max(0, inner_core - overflow)
			if outer_core <= 0:
				inner_core_exposed.emit()
	else:
		inner_core = max(0, inner_core - amount)
	
	health_changed.emit(outer_core, inner_core, total_damage)
	
	if is_ignited():
		ignited.emit()

func is_inner_exposed() -> bool:
	return outer_core <= 0

func get_kb_multiplier() -> float:
	return INNER_KB_MULT if is_inner_exposed() else 1.0

func is_ignited() -> bool:
	return outer_core <= 0 and inner_core <= 0

func get_health_percentage() -> float:
	return ((outer_core + inner_core) / (OUTER_MAX + INNER_MAX)) * 100.0
