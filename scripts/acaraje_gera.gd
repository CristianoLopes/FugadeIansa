extends Node

var pre_acaraje= preload("res://scenas/acaraje.tscn")
var intervalo = 2

func _ready():
	set_process(true)
	
	pass
func _process(delta):
	if intervalo > 0:
		intervalo -= delta
	else:
		intervalo = rand_range(50, 1)
		var acaraje = pre_acaraje.instance()
		var acaraje2 = pre_acaraje.instance()
		acaraje.set_pos(Vector2(rand_range(100, 1000), 600))
		get_owner().add_child(acaraje)

	pass