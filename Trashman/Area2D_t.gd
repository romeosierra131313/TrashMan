extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x = 0
var y = 0 
var elapsed = 0
var value = 0
var energy = 0
onready var tween = get_node("Tween")
var s = Vector2(get_transform().get_scale().x ,get_transform().get_scale().y)

# Called when the node enters the scene tree for the first time.
func _ready():
	s.x +=.2
	s.y +=.2
	tween.interpolate_property(self,"scale",get_transform().get_scale(),s,1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	newPos()
	get_parent().add_child(self,false)
	pass # Replace with function body.
func setValue(e):
	value = e
	pass
func setEnergy(e):
	energy = e
	pass
func newPos():
	x = randi()%(1024-64)+1;
	y = randi()%(600-64)+1;
	if y < 100:
		y = 100
	position.x = x
	position.y = y
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	
	elapsed += delta
	if elapsed > 1:
		get_parent().spawnTrash()
		elapsed = 0



func _on_Area2D_t_area_entered(area):
	get_parent().spawnTrash()
	get_parent().modEnergy(energy)
	get_parent().incScore(value)
	get_parent().incTrashCount(-1)
	queue_free()
	pass # Replace with function body.
