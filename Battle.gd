extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_enemy_stats(player_level):
	$Enemy.set_stats(player_level)
