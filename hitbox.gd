extends Area2D

var PC = Player


func _on_body_entered(body: Node2D) -> void:
	if PC:
		get_tree().reload_current_scene()
	pass # Replace with function body.
