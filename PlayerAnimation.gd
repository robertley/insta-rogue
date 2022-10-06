extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play()
	
func set_player_walking():
	$AnimatedSprite.animation = "walk"

func set_player_idle():
	$AnimatedSprite.animation = "default"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
