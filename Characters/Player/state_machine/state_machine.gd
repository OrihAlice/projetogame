extends Node

@export
var estado_inicial: Estado_player

var estado_atual: Estado_player

func init(parent: CharacterBody2D) -> void:
	for child in get_children():
		child.parent = parent
	
	change_state(estado_atual)
	


func change_state(novo_estado: Estado_player) -> void:
	if estado_atual:
		estado_atual.exit()
	estado_atual = novo_estado
	estado_atual.enter()
	

func process_physics(delta: float) -> void:
	var novo_estado = estado_atual.process_physics(delta)
	if novo_estado:
		change_state(novo_estado)

func process_input(event: InputEvent) -> void:
	var novo_estado = estado_atual.process_input(event)
	if novo_estado:
		change_state(novo_estado)

func process_frame(delta: float) -> void:
	var novo_estado = estado_atual.process_frame(delta)
	if novo_estado:
		change_state(novo_estado)
