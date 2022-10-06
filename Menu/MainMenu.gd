extends CanvasLayer

signal finished_menu

var playerName

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_PlayerName_text_changed(new_text):
	var disabledButton = true
	if (new_text != ""):
		disabledButton = false
	
	$StartButton.disabled = disabledButton

func _on_StartButton_pressed():
	playerName = $NameInput/PlayerName.text
	emit_signal("finished_menu")
