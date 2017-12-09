extends Area2D
	
func _on_acaraje_body_enter( body ):
	body.acaraje()
	get_node("acaraje").play("mordida")
	get_node("spriteacaraje").play("acaraje_ponto")
	get_node("CollisionShape2D").queue_free()
	yield(get_node("spriteacaraje"), "finished")
	queue_free()