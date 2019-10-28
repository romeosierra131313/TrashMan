extends Button

onready var tween = get_node("Tween")
var s = Vector2(self.get_rect().position.x,self.get_rect().position.y)

# Called when the node enters the scene tree for the first time.
func _ready():
	s.x -= 4
	tween.interpolate_property(self,"rect_position",self.get_rect().position,s,0.25,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	
	pass # Replace with function body.
func reset():
	if self.get_rect().position.x < 4:
		s.x += 4
		tween.interpolate_property(self,"rect_position",self.get_rect().position,s,0.25,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		tween.start()
	pass
func tweenit():
	s.x -= 4
	tween.interpolate_property(self,"rect_position",self.get_rect().position,s,0.25,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	pass