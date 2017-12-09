extends Area2D



func _on_mana_body_enter( body ):
	body.maca()
	get_node("maca").play("mordidamaca") 
	get_node("spritemaca").play("maca_ponto")
	get_node("CollisionShape2D").queue_free()
	yield(get_node("spritemaca"), "finished")
	queue_free()