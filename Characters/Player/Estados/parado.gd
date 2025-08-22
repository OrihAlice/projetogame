extends Estado

@export
var caindo: Estado
@export
var andando: Estado
@export
var pulando: Estado

func enter() -> void:
	super()
	parent.animacoes.pause()
	parent.velocity.x = 0

func process_input(event: InputEvent) -> Estado:
	if Input.is_action_just_pressed('pular') and parent.is_on_floor():
		return pulando
	if Input.is_action_just_pressed('Esquerda') or Input.is_action_just_pressed('Direita') or parent.velocity.x != 0:
		return andando
	return null

func process_physics(delta: float) -> Estado:
	parent.velocity.y += gravity * delta
	
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return caindo
	return null
