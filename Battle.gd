extends Node

signal attack
signal battle_over

var _player: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_enemy_stats(player):
	_player = player
	$Enemy.set_stats(player)

func _on_AttackButton_pressed():
	emit_signal("attack")
	$Enemy.hit(1)

func _on_Enemy_death():
	$CanvasLayer.hide()
	$BattleOver.start()

func _on_BattleOver_timeout():
	emit_signal("battle_over")
