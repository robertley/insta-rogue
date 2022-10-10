extends Node

signal death

var original_pos_x

var health
var max_health
var attack_power


func _ready():
	original_pos_x = $Area2D.position.x
	
func set_stats(player):
	player = player
	# TODO logic
	health = 5
	max_health = 5
	attack_power = 1
	$Area2D/ProgressBar.max_value = max_health
	$Area2D/ProgressBar.value = health
	print(max_health)

func _process(delta):
	if (!$EnterTimer.is_stopped()):
		check_walk_position()
		
func check_walk_position():
	var timer_length = $EnterTimer.wait_time
	$Area2D.position.x = original_pos_x - (timer_length - $EnterTimer.time_left) * 300

func _on_EnterTimer_timeout():
	$Area2D/ProgressBar.show()
	
func hit(amt):
	health = max(health - amt, 0)
	$Area2D/ProgressBar.value = health
	if (health == 0):
		emit_signal("death")
		$DeathTimer.start()

func _on_DeathTimer_timeout():
	$Area2D.hide()
