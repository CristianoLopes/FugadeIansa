extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	
	pass
func play(sample_name):
	get_node("stream_player1").play(sample_name)
	
