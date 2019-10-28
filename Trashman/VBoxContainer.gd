extends VBoxContainer

onready var tween = get_node("Button_newGame/Tween")
var s = Vector2(get_transform().get_scale().x ,get_transform().get_scale().y)

# Called when the node enters the scene tree for the first time.
func _ready():
	s.x +=.2
	s.y +=.2
	tween.interpolate_property(get_node("Button_newGame"),"scale",get_node("Button_newGame").get_transform().get_scale(),s,1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	pass # Replace with function body.

