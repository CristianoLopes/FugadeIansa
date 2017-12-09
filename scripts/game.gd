extends Node2D

onready var person = get_node("Oya")
onready var camera = get_node("Respaw")
var acaraje = 0
var ameixa = 0 
var manga = 0
var maca = 0
var bestscore = 0 setget set_bestscore
const filepath = "user://bestscore.data"
func _ready():
	load_bestscore()

	


func change_camera():
	camera.set_global_pos(person.get_node("camera").get_camera_pos())
	camera.make_current()

func _on_Oya_morreu():

	get_node("somHit").play()
	get_node("respaw_time").start()
	transition.fade_to("res://scenas/mainMenu.tscn")
	get_node("respaw_time").set_wait_time(2.5)
	get_node("canvasLayer/tex_bestscore").set_text(str(game.bestscore))
	get_node("canvasLayer/ameixa_score").set_text(str(game.bestscore))
	get_node("canvasLayer/manga_score").set_text(str(game.bestscore))
	get_node("canvasLayer/maca_score").set_text(str(game.bestscore))
	

	
#func _on_respaw_time_timeout():
	#reviver()
	
	
#func reviver():
#	person.set_pos(get_node("respaw_point").get_pos())
#	person.reviver()
#	get_node("Oya/spriteOya").set_flip_h(false)


func _on_Oya_acaraje():
	acaraje += 50
	get_node("canvasLayer/pontos_acaraje").set_text(str(acaraje))
	
	if acaraje  > game.bestscore:
		game.bestscore =  acaraje

	pass # replace with function body


func _on_Oya_ameixa():
	ameixa += 5
	get_node("canvasLayer/pontos_ameixa").set_text(str(ameixa))
	
	if ameixa  > game.bestscore:
		game.bestscore =  ameixa
	pass # replace with function body

func _on_Oya_manga():
	manga += 25
	get_node("canvasLayer/pontos_manga").set_text(str(manga))
	
	
	if manga  > game.bestscore:
		game.bestscore =  manga
	pass # replace with function body


func _on_Oya_maca():
	maca += 15
	get_node("canvasLayer/pontos_maca").set_text(str(maca))
	
	if maca  > game.bestscore:
		game.bestscore =  maca
	pass # replace with function body

func load_bestscore():
	var file = File.new()
	if not file.file_exists(filepath): return
	file.open(filepath, File.READ)
	bestscore = file.get_var()
	file.close()
	
func save_bestscore():
	var file = File.new()
	file.open(filepath, File.WRITE)
	file.store_var(bestscore)
	file.close()
	
func set_bestscore(new_value):
	bestscore = new_value
	save_bestscore()
	
