extends Label

onready var tween = get_node("Tween")
var s = Vector2(self.rect_scale.x,self.rect_scale.y)


func _ready():
	s.x += 2
	s.y += 2
	tween.interpolate_property(self,"rect_scale",self.rect_scale,s,0.25,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()	
	
	pass
func setPosX(x):
	get_rect().position.x = x
	pass
func setPosY(y):
	get_rect().position.y = y
	pass
func setText(t):
	text = t
	pass
func tweenit():
	s.x -= 2
	s.y -= 2
	self.rect_scale = s
	
	s.x += 2
	s.y += 2
	
	tween.interpolate_property(self,"rect_scale",self.get_rect().size,s,0.25,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()	
	




