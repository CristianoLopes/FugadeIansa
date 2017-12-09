extends Node2D

onready var person = get_node("Oya")
onready var camera = get_node("Respaw")
var acaraje = 0
var ameixa = 0 
var manga = 0
var maca = 0
func _ready():
	
	pass

func change_camera():
	camera.set_global_pos(person.get_node("camera").get_camera_pos())
	camera.make_current()

func _on_Oya_morreu():
	get_node("respaw_time").start()
	transition.fade_to("res://scenas/mainMenu.tscn")
#	change_camera()
	get_node("respaw_time").set_wait_time(2.5)

	
#func _on_respaw_time_timeout():
	#reviver()
	
	
#func reviver():
#	person.set_pos(get_node("respaw_point").get_pos())
#	person.reviver()
#	get_node("Oya/spriteOya").set_flip_h(false)


func _on_Oya_acaraje():
	acaraje += 50
	get_node("canvasLayer/pontos_acaraje").set_text(str(acaraje))
	pass # replace with function body


func _on_Oya_ameixa():
	ameixa += 5
	get_node("canvasLayer/pontos_ameixa").set_text(str(ameixa))
	pass # replace with function body

func _on_Oya_manga():
	manga += 25
	get_node("canvasLayer/pontos_manga").set_text(str(manga))
	pass # replace with function body


func _on_Oya_maca():
	maca += 15
	get_node("canvasLayer/pontos_maca").set_text(str(maca))
	pass # replace with function body
