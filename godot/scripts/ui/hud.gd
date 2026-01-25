extends Control

## HUD for displaying player stats during matches

@onready var p1_outer_bar = $P1Stats/CoreBar/OuterBar
@onready var p1_inner_bar = $P1Stats/CoreBar/InnerBar
@onready var p1_kindle_bar = $P1Stats/KindleBar
@onready var p1_damage_label = $P1Stats/DamageLabel

@onready var p2_outer_bar = $P2Stats/CoreBar/OuterBar
@onready var p2_inner_bar = $P2Stats/CoreBar/InnerBar
@onready var p2_kindle_bar = $P2Stats/KindleBar
@ontml:parameter name="p2_damage_label = $P2Stats/DamageLabel

var player1: StickFighter
var player2: StickFighter

func _ready() -> void:
	call_deferred("setup_players")

func setup_players() -> void:
	var players = get_tree().get_nodes_in_group("players")
	for player in players:
		if player is StickFighter:
			if player.player_id == 1:
				player1 = player
				setup_player_hud(player1, 1)
			elif player.player_id == 2:
				player2 = player
				setup_player_hud(player2, 2)

func setup_player_hud(player: StickFighter, player_id: int) -> void:
	# Connect to health changes
	player.core_health.health_changed.connect(
		func(outer, inner, total): _on_health_changed(player_id, outer, inner, total)
	)
	
	# Connect to kindle changes
	player.kindle_system.kindle_changed.connect(
		func(value): _on_kindle_changed(player_id, value)
	)
	
	# Initialize bars
	_on_health_changed(player_id, 
		player.core_health.outer_core,
		player.core_health.inner_core,
		player.core_health.total_damage)
	_on_kindle_changed(player_id, player.kindle_system.kindle)

func _on_health_changed(player_id: int, outer: float, inner: float, total: float) -> void:
	var outer_bar = p1_outer_bar if player_id == 1 else p2_outer_bar
	var inner_bar = p1_inner_bar if player_id == 1 else p2_inner_bar
	var damage_label = p1_damage_label if player_id == 1 else p2_damage_label
	
	if outer_bar:
		outer_bar.value = outer
	if inner_bar:
		inner_bar.value = inner
	if damage_label:
		damage_label.text = "%d%%" % int(total)

func _on_kindle_changed(player_id: int, value: float) -> void:
	var kindle_bar = p1_kindle_bar if player_id == 1 else p2_kindle_bar
	
	if kindle_bar:
		kindle_bar.value = value
