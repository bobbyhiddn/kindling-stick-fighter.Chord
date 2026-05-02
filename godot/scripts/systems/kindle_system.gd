class_name KindleSystem
extends Node

## Kindle gauge system for special attacks
## Fills on hit/hurt, decays when idle, spends on specials

const KINDLE_MAX: float = 100.0
const DECAY_RATE: float = 2.0
const DECAY_DELAY: float = 3.0

var kindle: float = 0.0
var time_since_action: float = 0.0

signal kindle_changed(value: float)

func _ready() -> void:
	reset()

func reset() -> void:
	kindle = 0.0
	time_since_action = 0.0
	kindle_changed.emit(kindle)

func _process(delta: float) -> void:
	time_since_action += delta
	
	# Decay kindle after delay
	if time_since_action >= DECAY_DELAY and kindle > 0:
		kindle = max(0, kindle - DECAY_RATE * delta)
		kindle_changed.emit(kindle)

func add_kindle(amount: float) -> void:
	kindle = min(KINDLE_MAX, kindle + amount)
	time_since_action = 0.0
	kindle_changed.emit(kindle)

func spend_kindle(cost: float) -> bool:
	if kindle >= cost:
		kindle -= cost
		time_since_action = 0.0
		kindle_changed.emit(kindle)
		return true
	return false

func can_afford(cost: float) -> bool:
	return kindle >= cost

func get_kindle_percentage() -> float:
	return (kindle / KINDLE_MAX) * 100.0
