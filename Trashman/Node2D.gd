extends Node2D

onready var trash_1 = load("res://Trash/Trash_1.tscn")
onready var trash_2 = load("res://Trash/Trash_2.tscn")
onready var trash_3 = load("res://Trash/Trash_3.tscn")
onready var trash_4 = load("res://Trash/Trash_4.tscn")
onready var trash_5 = load("res://Trash/Trash_5.tscn")
onready var trash_6 = load("res://Trash/Trash_6.tscn")

onready var s = get_node("AudioStreamPlayer2D")
 
onready var pu = get_node("Label")
var start = false

var score = 0
var level1 = 1000
var level2 = 3000
var level3 = 10000
var level4 = 30000
var level5 = 60000
var level6 = 100000


var time = 0
var trashCount = 0
var energy = 1000
var level = 1
var trashLimit = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Level/Label").text = str(level)
	pu.setPosX(512)
	pu.setPosY(300)
	
	
	pass # Replace with function body.
func pickupsound():
	get_parent().playdsound()
	
	pass
func modEnergy(e):
	energy += e
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start == false:	
		time += delta
		if time <= 4:
			pu.setText(str(int(time)))
		if time > 4:
			start = true
			pu.hide()
	if start == true:
		
		time +=delta
		if time > 2:
			pu.hide()
	
	
	get_node("Score/Label").text = str(score)
	get_node("Energy/Label").text = str(energy)
	
	if energy < 0 :
		get_node("Area2D2_p").dir = -1
		get_parent().setGameOver()
		
	
	pass
func reset():
	start = false
	time = 0
	pu.show()
	level = 1
	trashLimit = 10
	get_node("Level/Label").text = str(level)
	score = 0 
	energy = 1000
	for i in range (7,get_child_count()):
		get_child(i).queue_free()
		incTrashCount(-1)
	get_node("Area2D2_p").positionReset(512,300)
	get_node("Level/Sprite").resetScale()	
func getScore():
	return score
	pass
func incScore(a):
	var e = 0
	score += a
	match level:
		1:
			e = level1/score	
		2:
			e = level2/score
		3:
			e = level3/score
		4:
			e = level4/score
		5:
			e = level5/score
		6:
			e = level6/score

	get_node("Level/Sprite").incScale(e)
	pass
func incTrashLimit(e):
	trashLimit -= e
	pass
func setLevel():
	var e = level
	
	if level == 1 && score >= level1:
		level += 1
		incTrashLimit(1)
		get_node("Area2D2_p").setPoffset(1)
	if level == 2 && score >= level2:
		level += 1
		incTrashLimit(1)
		get_node("Area2D2_p").setPoffset(1)
	if level == 3 && score >= level3:
		level += 1
		incTrashLimit(2)
		get_node("Area2D2_p").setPoffset(2)
	if level == 4 && score >= level4:
		level += 1
		incTrashLimit(2)
		get_node("Area2D2_p").setPoffset(3)
	if level == 5 && score >= level5:
		level += 1
		get_node("Area2D2_p").setPoffset(3)
	if level == 6 && score >= level6:
		level += 1
		get_node("Area2D2_p").setPoffset(1)
		get_node("Level/Label").text = str(level)
	
	if e != level:
		get_node("Level/Sprite").resetScale()	
	
		pu.setText("Level " + str(level))
		pu.show()
		pu.tweenit()
		time = 0
	
	pass
func spawnTrash():
	if trashCount < trashLimit:
		var e = randi()%level+1 
		
		match e:
			1:
				var i = trash_1.instance()
				i.setValue(level*100*e)
				i.setEnergy(get_node("Area2D2_p").getPoffset()*50)
				add_child(i)
				incTrashCount(1)
			2: 
				var i = trash_2.instance()
				i.setValue(level*100*e)
				i.setEnergy(get_node("Area2D2_p").getPoffset()*50)
				add_child(i)
				incTrashCount(1)
			3: 
				var i = trash_3.instance()
				i.setValue(level*100*e)
				i.setEnergy(get_node("Area2D2_p").getPoffset()*50)
				add_child(i)
				incTrashCount(1)
			4: 
				var i = trash_4.instance()
				i.setValue(level*100*e)
				i.setEnergy(get_node("Area2D2_p").getPoffset()*50)
				add_child(i)
				incTrashCount(1)
			5: 
				var i = trash_5.instance()
				i.setValue(level*100*e)
				i.setEnergy(get_node("Area2D2_p").getPoffset()*50)
				add_child(i)
				incTrashCount(1)
			6: 
				var i = trash_6.instance()
				i.setValue(level*100*e)
				i.setEnergy(get_node("Area2D2_p").getPoffset()*50)
				add_child(i)
				incTrashCount(1)
		setLevel()
		
		
	pass
func incTrashCount(e):
	trashCount += e

func _on_Area2D2_p_area_entered(area):
	pickupsound()
	
	pass # Replace with function body.


func _on_Area2D_w_area_entered(area):
	get_parent().setGameOver()
	pass # Replace with function body.
