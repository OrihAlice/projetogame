extends Node

@export
var estado_inicial: Pernas_estados

var estado_atual: Pernas_estados


func init(parent: Area2D) -> void:
	for child in get_children():
		child.parent = parent
	
	change_state(estado_atual)

func change_state(novo_estado: Pernas_estados) -> void:
	if estado_atual:
		estado_atual.exit()
	
	estado_atual = estado_inicial
	estado_atual.enter()

func process_physics(delta: float) -> void:
	var novo_estado = estado_atual.process_physics(delta)
	if novo_estado:
		change_state(novo_estado)

func process_frame(delta: float) -> void:
	var novo_estado = estado_atual.process_frame(delta)
	if novo_estado:
		change_state(novo_estado)

func process_input(input: InputEvent) -> void:
	var novo_estado = estado_atual.process_input(input)
	if novo_estado:
		change_state(novo_estado)
