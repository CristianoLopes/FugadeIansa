extends Position2D

onready var manga = preload("res://scenas/manga.tscn")

func _ready():
	randomize()
	# Initialization here
	


func _on_Timer_timeout():
	var novaManga = manga.instance()
	novaManga.set_global_pos( Vector2(0, 10))
	add_child(novaManga)
	