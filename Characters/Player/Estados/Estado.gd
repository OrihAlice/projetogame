class_name Estado_player
extends Node

@export
var animation_name: String
@export
var move_speed: float = 400

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

## guarda uma referencia do parente para que possa controlalo
var parent: CharacterBody2D

func enter() -> void:
	parent.animacoes.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> Estado_player:
	return null
	
func process_frame(delta: float) -> Estado_player:
	return null

func process_physics(delta: float) -> Estado_player:
	return null
