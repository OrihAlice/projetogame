class_name Pernas_estados
extends Node

@export
var animation_name: String
@export
var move_speed: float = 400

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent: Area2D

func enter() -> void:
	parent.animacoes.play(animation_name)

func exit() -> void:
	pass

func process_physics(delta: float) -> Pernas_estados:
	return null

func process_input(input: InputEvent) -> Pernas_estados:
	return null

func process_frame(delta: float) -> Pernas_estados:
	return null
