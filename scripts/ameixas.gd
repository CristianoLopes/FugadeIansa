extends Area2D



func _on_ameixas_body_enter( body ):
	body.ameixa()
	get_node("ameixa").play("mordidaameixa") 
	get_node("spriteameixa").play("ameixa_ponto")
	get_node("CollisionShape2D").queue_free()
	yield(get_node("spriteameixa"), "finished")
	queue_free()