extends Estado

@export
var andando: Estado
@export
var parado: Estado
@export
var pulando: Estado


func process_input(event: InputEvent) -> Estado:
	return null

func process_physics(delta: float) -> Estado:
	parent.velocity.y += gravity * delta
	var movement = Input.get_axis('Esquerda', "Direita") * move_speed
	
	if movement != 0:
		parent.animacoes.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return andando
		return parado
	return null
