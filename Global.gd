extends Node

var VP = Vector2.ZERO
var score = 0
var time = 100
var lives = 5




func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed",self,"_resize")
	

func _resize():
	VP = get_viewport().size
	
func _reset():
	score = 0
	time = 100
	lives = 5
	get_tree().paused = false
	
func update_score(s):
	score = score + s
	var hud = get_node_or_null("/root/Game/UI/Hud")
	if hud != null:
		hud.update_score()
		
func update_time(t):
	time = time + t
	if time <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var hud = get_node_or_null("/root/Game/UI/Hud")
	if hud != null:
		hud.update_time()
		
	
func update_lives(l):
	lives = lives + l
	if lives <= 0:
		var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
	var hud = get_node_or_null("/root/Game/UI/Hud")
	if hud != null:
		hud.update_lives()
