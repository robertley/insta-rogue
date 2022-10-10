extends Node

export(PackedScene) var battle_scene
var inst_battle_scene

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
	$Player.walk_back()
	start_battle()
	
func start_battle():
	var inst_battle_scene = battle_scene.instance()
	inst_battle_scene.set_enemy_stats($Player)
	add_child(inst_battle_scene)
	inst_battle_scene.connect("battle_over", self, "walk_forward")
	
func walk_forward():
	$Player.walk_forward()
