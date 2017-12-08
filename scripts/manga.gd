extends Node2D


func _on_manga_body_enter( body ):
	get_node("manga").play("mordidamanga")
	get_node("spritemanga").play("manga_ponto")
	get_node("CollisionShape2D").queue_free()
	yield(get_node("spritemanga"), "finished")
	queue_free()
	
	
	