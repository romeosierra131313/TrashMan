extends Area2D


var x = 0
var y = 0 
var dir = -1
var poffset = 5
onready var tween = get_node("Tween")
var s = Vector2(get_transform().get_scale().x ,get_transform().get_scale().y)


var started = false
var time = 0

# Called when the node enters the scene tree for the first time.
func positionReset(tx,ty):
	x = tx
	y = ty
	position.x = tx
	position.y = ty
	dir = -1
	poffset = 5
	started = true
	time = 0
	get_node("Label").hide()
func _ready():
	get_node("Label").hide()
	s.x +=.2
	s.y +=.2
	tween.interpolate_property(self,"scale",get_transform().get_scale(),s,1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	pass # Replace with function body.
func setPoffset(e):
	if poffset < 10:
		poffset += e
	pass
func getPoffset():
	return poffset
	pass
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_A:
			dir = 0
			get_node("CollisionShape2D/Sprite").rotation_degrees = 0
		if event.pressed and event.scancode == KEY_D:
			dir = 1
			get_node("CollisionShape2D/Sprite").rotation_degrees = 180
		if event.pressed and event.scancode == KEY_W:
			get_node("CollisionShape2D/Sprite").rotation_degrees = 90
			dir = 2
		if event.pressed and event.scancode == KEY_S:
			get_node("CollisionShape2D/Sprite").rotation_degrees = 270
			dir = 3
	pass
func _process(delta):
	if !started:
		time += delta
		get_node("Label").text = str(int(time))
		if time >= 3:
			dir = randi()%3+1
			get_node("Label").hide()
			started = true
			time = 0
	
	
	match dir:
		0:
			x -=poffset
			position.x = x
		1:
			x +=poffset
			position.x = x
		2:
			y -=poffset
			position.y = y
		3:
			y +=poffset
			position.y = y
			
	if dir != -1:
		get_parent().modEnergy(-poffset)
	
	if x < 0 || y < 0:
		get_parent().get_parent().setGameOver()
		
		print(str(x) + " x ")
		print(str(y)+" y")
	if x > 1024 || y > 600:
		get_parent().get_parent().setGameOver()
		
		print(str(x) + " x ")
		print(str(y)+" y")

		
	pass



