extends Node

var pre_manga = preload("res://scenas/manga.tscn")
var intervalo = 2

func _ready():
	set_process(true)
	
	pass
func _process(delta):
	if intervalo > 0:
		intervalo -= delta
	else:
		intervalo = rand_range(20, 1)
		var manga = pre_manga.instance()
		manga.set_pos(Vector2(rand_range(5000, 10000), rand_range(311, 100)))
		get_owner().add_child(manga)
	pass