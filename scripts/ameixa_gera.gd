extends Node

var pre_ameixa = preload("res://scenas/ameixas.tscn")
var intervalo = 2

func _ready():
	set_process(true)
	
	pass
func _process(delta):
	if intervalo > 0:
		intervalo -= delta
	else:
		intervalo = rand_range(10, 1)
		var ameixa = pre_ameixa.instance()
		ameixa.set_pos(Vector2(rand_range(1000, 3000), rand_range(600, 100)))
		get_owner().add_child(ameixa)
	pass