extends Node

## Game manager for Kindling matches
## Handles match flow, blast zones, and victory conditions

@export var blast_zone_left: float = -600.0
@export var blast_zone_right: float = 600.0
@export var blast_zone_top: float = -400.0
@export var blast_zone_bottom: float = 400.0

var player1: StickFighter
var player2: StickFighter

signal match_ended(winner_id: int)

func _ready() -> void:
	# Find players
	call_deferred("setup_players")

func setup_players() -> void:
	var players = get_tree().get_nodes_in_group("players")
	for player in players:
		if player is StickFighter:
			if player.player_id == 1:
				player1 = player
			elif player.player_id == 2:
				player2 = player
			
			# Connect signals
			player.player_ignited.connect(_on_player_ignited)

func _process(_delta: float) -> void:
	# Check blast zones
	if player1:
		check_blast_zone(player1)
	if player2:
		check_blast_zone(player2)

func check_blast_zone(player: StickFighter) -> void:
	var pos = player.global_position
	
	if pos.x < blast_zone_left or pos.x > blast_zone_right or \
	   pos.y < blast_zone_top or pos.y > blast_zone_bottom:
		# Player launched off stage - Ignition!
		_on_player_ignited(player.player_id)

func _on_player_ignited(player_id: int) -> void:
	# Determine winner (opposite player)
	var winner_id = 2 if player_id == 1 else 1
	match_ended.emit(winner_id)
	print("Player %d wins! Player %d ignited!" % [winner_id, player_id])
