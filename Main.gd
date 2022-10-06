extends Node

export(PackedScene) var battle_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_MainMenu_finished_menu():
	var name = $MainMenu.playerName
	$Player.init_player(name)
	$MainMenu.hide()
	$ClassSelect.show()

func _on_ClassSelect_class_select():
	$Player.update_class($ClassSelect.player_class)

func _on_ClassSelect_class_finished():
	$ClassSelect.hide()
	$Player.walk()
	start_battle()
	
func start_battle():
	var b_scene = battle_scene.instance()
	b_scene.set_enemy_stats($Player.level)
	add_child(b_scene)
