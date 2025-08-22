extends Estado_player

@export
var caindo: Estado_player
@export
var andando: Estado_player
@export
var pulando: Estado_player
@export
var correndo: Estado_player

func enter() -> void:
	super()
	parent.animacoes.stop()
	parent.velocity.x = 0

func process_input(event: InputEvent) -> Estado_player:
	if Input.is_action_just_pressed('pular') and parent.is_on_floor():
		return pulando
	if Input.is_action_just_pressed('Esquerda') or Input.is_action_just_pressed('Direita') or parent.velocity.x != 0:
		return andando
	return null

func process_physics(delta: float) -> Estado_player:
	parent.velocity.y += gravity * delta
	
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return caindo
	return null
