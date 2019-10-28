extends Sprite
onready var tween = get_node("Tween")
var s = Vector2(get_transform().get_scale().x ,get_transform().get_scale().y)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func incScale(e):
	s.x +=e
	tween.interpolate_property(self,"scale",get_transform().get_scale(),s,1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	pass
func resetScale():
	s.x = 1
	tween.interpolate_property(self,"scale",get_transform().get_scale(),s,1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	#self.get_transform().get_scale().x = 1
