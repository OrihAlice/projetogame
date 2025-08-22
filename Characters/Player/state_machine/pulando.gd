extends Estado_player

@export
var caindo: Estado_player
@export
var parado: Estado_player
@export
var andando: Estado_player
@export
var correndo: Estado_player

@export
var forca_do_pulo: float = 900

func enter() -> void:
	super()
	parent.velocity.y = -forca_do_pulo


func process_physics(delta: float) -> Estado_player:
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
