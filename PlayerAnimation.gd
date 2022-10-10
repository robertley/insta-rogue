extends Area2D

func _ready():
	$AnimatedSprite.play()
	
func set_player_walking():
	$AnimatedSprite.animation = "walk"

func set_player_idle():
	$AnimatedSprite.animation = "default"
