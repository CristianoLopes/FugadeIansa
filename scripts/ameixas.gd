extends Area2D



func _on_ameixas_body_enter( body ):
	game.score += 5
	get_node("ameixa").play("mordidaameixa") 
	get_node("spriteameixa").play("ameixa_ponto")
	get_node("CollisionShape2D").queue_free()
	yield(get_node("spriteameixa"), "finished")
	queue_free()