extends Tree

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bsound  = get_node("AudioStreamPlayer3")
onready var csound  = get_node("AudioStreamPlayer")
onready var dsound  = get_node("AudioStreamPlayer2")

# Called when the node enters the scene tree for the first time.
func _ready():
	bsound.play(0)
	resetMenu()
	get_node("Control").show()
	get_node("Node2D").hide()
	get_node("GameOver").hide()
	get_node("Node2D/Area2D2_p").started = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func playdsound():
	dsound.play(0)
	pass
func newGame():
	csound.play(0)
	get_node("Control").hide()
	get_node("GameOver").hide()
	get_node("Node2D").show()
	get_node("Node2D").reset()
	get_node("Node2D/Area2D2_p").started = false
	get_node("Node2D").spawnTrash()
	
	pass
func _on_Button_newGame_pressed():
	newGame()
	pass # Replace with function body.

func setGameOver():
	get_node("Control").hide()
	get_node("Node2D").hide()
	if get_node("Node2D").energy <= 0:
		get_node("GameOver").setScore(str(get_node("Node2D").getScore() )+ ".....You ran out of energy!")
	else:
		get_node("GameOver").setScore(get_node("Node2D").getScore())
	get_node("GameOver").show()	

func _on_MainMenu_pressed():
	bsound.play(0)
	resetMenu()
	get_node("Control").show()
	get_node("Node2D").hide()
	get_node("Node2D").reset()
	get_node("GameOver").hide()
	pass # Replace with function body.

func resetMenu():
	get_node("Control/VBoxContainer/Button_Help/Panel").hide()
	get_node("Control/VBoxContainer/Button_About/Panel").hide()
	get_node("Control/VBoxContainer/Button_Credits/Panel").hide()
	get_node("Control/VBoxContainer/Button_Settings/Panel").hide()
	pass
func _on_PlayAgain_pressed():
	newGame()
	pass # Replace with function body.


func _on_Button_Help_pressed():
	resetMenu()
	get_node("Control/VBoxContainer/Button_Help/Panel").show()
	pass # Replace with function body.


func _on_Button_About_pressed():
	resetMenu()
	get_node("Control/VBoxContainer/Button_About/Panel").show()
	pass # Replace with function body.


func _on_Button_Credits_pressed():
	resetMenu()
	get_node("Control/VBoxContainer/Button_Credits/Panel").show()
	pass # Replace with function body.


func _on_Button_newGame_mouse_entered():
	get_node("Control/VBoxContainer/Button_newGame").tweenit()
	pass # Replace with function body.


func _on_Button_newGame_mouse_exited():
	get_node("Control/VBoxContainer/Button_newGame").reset()
	pass # Replace with function body.


func _on_Button_Help_mouse_entered():
	get_node("Control/VBoxContainer/Button_Help").tweenit()
	pass # Replace with function body.


func _on_Button_Help_mouse_exited():
	get_node("Control/VBoxContainer/Button_Help").reset()
	pass # Replace with function body.


func _on_Button_About_mouse_entered():
	get_node("Control/VBoxContainer/Button_About").tweenit()
	pass # Replace with function body.


func _on_Button_About_mouse_exited():
	get_node("Control/VBoxContainer/Button_About").reset()
	pass # Replace with function body.


func _on_Button_Credits_mouse_entered():
	get_node("Control/VBoxContainer/Button_Credits").tweenit()
	pass # Replace with function body.


func _on_Button_Credits_mouse_exited():
	get_node("Control/VBoxContainer/Button_Credits").reset()
	pass # Replace with function body.


func _on_Button_Settings_pressed():
	resetMenu()
	get_node("Control/VBoxContainer/Button_Settings/Panel").show()
	pass # Replace with function body.


func _on_Apply_pressed():
	if get_node("Control/VBoxContainer/Button_Settings/Panel/Sound/CheckBox").pressed:
		bsound.play(0)
	if !get_node("Control/VBoxContainer/Button_Settings/Panel/Sound/CheckBox").pressed:
		
		bsound.stop()	
	
	
	pass # Replace with function body.


func _on_HSlider_value_changed(value):
	bsound.volume_db = get_node("Control/VBoxContainer/Button_Settings/Panel/Volume/HSlider").value-85
	pass # Replace with function body.


func _on_HSlider2_value_changed(value):
	csound.volume_db = get_node("Control/VBoxContainer/Button_Settings/Panel/Volume/HSlider2/").value -85
	dsound.volume_db = get_node("Control/VBoxContainer/Button_Settings/Panel/Volume/HSlider2/").value  -85
	csound.play(0)
	pass # Replace with function body.
