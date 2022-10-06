extends CanvasLayer

var player_class = "Warrior"
signal class_select
signal class_finished

func _ready():
	on_class_select()

func _on_WarriorButton_pressed():
	player_class = "Warrior"
	on_class_select()

func _on_MageButton_pressed():
	player_class = "Wizard"
	on_class_select()
	
func on_class_select():
	draw_label()
	emit_signal('class_select')
	
func draw_label():
	$SelectedClassLabel.text = player_class


func _on_Select_pressed():
	emit_signal("class_finished")
