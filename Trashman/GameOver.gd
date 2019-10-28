extends Control

func _ready():
	
	pass # Replace with function body.
func setScore(e):
	get_node("CenterContainer/VBoxContainer/Score/Label").text = str(e)
	pass