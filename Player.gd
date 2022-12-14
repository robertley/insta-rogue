extends Node

var max_health = 10
var health = 10
var might = 5
var max_mana = 5
var mana = 5
var intelligence = 5
var luck = 0
var determination = 0
var karma = 0

var level = 1
var gold = 0

var player_class = "Warrior"

export var player_name = "Player"

var walking_direction = "back"
var current_pos_x

# Called when the node enters the scene tree for the first time.
func _ready():
	set_class_defaults()
	current_pos_x = $Area2D.position.x
	
func _process(delta):
	update_stats()
	
	if (!$WalkingTimer.is_stopped()):
		check_walk_position(delta)

func init_player(name):
	player_name = name
	$StatsCanvas/Name.text = player_name + ": level " + str(level)
	
	$StatsCanvas.show()
	
func update_stats():
	$StatsCanvas/Health.text = 'Health: ' + str(health) + '/' + str(max_health)
	$StatsCanvas/Mana.text = 'Mana: ' + str(mana) + '/' + str(max_mana)
	$StatsCanvas/Might.text = 'Might: ' + str(might)
	$StatsCanvas/Intelligence.text = 'Intelligence: ' + str(intelligence)
	$StatsCanvas/Luck.text = 'Luck: ' + str(luck)
	$StatsCanvas/Determination.text = 'Determination: ' + str(determination)
	
func update_class(p_class):
	player_class = p_class
	set_class_defaults()
	
func set_class_defaults():
	match(player_class):
		'Warrior':
			set_warrior_defaults()
		'Wizard':
			set_wizart_defaults()
		
			
func set_warrior_defaults():
	max_health = 8
	health = max_health
	max_mana = 3
	mana = max_mana
	might = 5
	intelligence = 2
	luck = 0
	determination = 5
	karma = 0
	
func set_wizart_defaults():
	max_health = 5
	health = max_health
	max_mana = 6
	mana = max_mana
	might = 2
	intelligence = 5
	luck = 0
	determination = 5
	karma = 0
	
func walk_back():
	walking_direction = "back"
	$Area2D.set_player_walking()
	$WalkingTimer.start()
	
func walk_forward():
	walking_direction = "forward"
	$Area2D.set_player_walking()
	$WalkingTimer.start()


func _on_WalkingTimer_timeout():
	current_pos_x = $Area2D.position.x
	$WalkingTimer.stop()
	$Area2D.set_player_idle()
	
func check_walk_position(delta):
	var timer_length = $WalkingTimer.wait_time
	var x_mod = 1
	if (walking_direction == "back"):
		x_mod = -1
	
	var destination = 120 * x_mod
	
	$Area2D.position.x = current_pos_x + ((timer_length - $WalkingTimer.time_left) / timer_length * destination)
	
