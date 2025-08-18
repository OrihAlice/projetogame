extends CharacterBody2D

@export var pc_speed = 200


func get_input():
	var direcao = Input.get_vector("Esquerda", "Direita", "Cima", "Baixo")
	velocity = direcao * pc_speed
	pass

func _physics_process(delta):
	get_input()
	move_and_slide()
	pass
