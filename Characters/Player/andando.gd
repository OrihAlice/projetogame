extends Estado_player

@export
var caindo: Estado_player
@export
var parado: Estado_player
@export
var pulando: Estado_player


func process_input(event: InputEvent) -> Estado_player:
	if Input.is_action_just_pressed('pular') and parent.is_on_floor():
		return pulando
	return null

func process_physics(delta: float) -> Estado_player:
	parent.velocity.y += gravity * delta
	
	var movement = Input.get_axis('Esquerda', "Direita") * move_speed
	
	if movement == 0 and !Input.is_action_pressed("Direita") and !Input.is_action_pressed("Direita") :
		return parado
	
	parent.animacoes.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return pulando
	return null
