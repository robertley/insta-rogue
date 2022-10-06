extends Node

var original_pos_x

var health
var max_health

func _ready():
	original_pos_x = $Area2D.position.x
	
func set_stats(player_level):
	# TODO logic
	health = 5
	max_health = 5
	print(max_health)

func _process(delta):
	if (!$EnterTimer.is_stopped()):
		check_walk_position()
		
func check_walk_position():
	var timer_length = $EnterTimer.wait_time
	$Area2D.position.x = original_pos_x - (timer_length - $EnterTimer.time_left) * 300
