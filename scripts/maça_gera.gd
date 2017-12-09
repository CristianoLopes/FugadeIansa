extends Node

var pre_maca = preload("res://scenas/mança.tscn")
var intervalo = 2

func _ready():
	set_process(true)
	
	pass
func _process(delta):
	if intervalo > 0:
		intervalo -= delta
	else:
		intervalo = rand_range(15, 1)
		var maca = pre_maca.instance()
		maca.set_pos(Vector2(rand_range(4000, 7000), rand_range(600, 100)))
		get_owner().add_child(maca)
	pass