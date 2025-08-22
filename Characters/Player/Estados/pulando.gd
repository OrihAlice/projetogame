extends Estado

@export
var caindo: Estado
@export
var parado: Estado
@export
var andando: Estado

@export
var forca_do_pulo: float = 900

func enter() -> void:
	super()
	parent.velocity.y = -forca_do_pulo


func process_physics(delta: float) -> Estado:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return caindo
		
	
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
