extends Node2D

onready var person = get_node("Oya")
onready var camera = get_node("Respaw")
var acaraje = 0
var ameixa = 0
var score = 0 setget setScore
signal score_changed

func _ready():
	
	pass

func change_camera():
	camera.set_global_pos(person.get_node("camera").get_camera_pos())
	camera.make_current()

func _on_Oya_morreu():
	change_camera()
	get_node("respaw_time").set_wait_time(2.5)
	get_node("respaw_time").start()
	
	



func _on_respaw_time_timeout():
	reviver()
	
func reviver():
	person.set_pos(get_node("respaw_point").get_pos())
	person.reviver()
	get_node("Oya/spriteOya").set_flip_h(false)
	


func _on_Oya_acaraje():
	acaraje += 50
	get_node("canvasLayer/pontos").set_text(str(acaraje))
	
	
func setScore(valor):
	if valor > 0:
		score = valor
		emit_signal("score_changed")
		




