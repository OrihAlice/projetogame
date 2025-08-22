class_name pernas
extends Area2D

@onready 
var animacoes: AnimatedSprite2D = $AnimatedSprite2D

@onready 
var pernocas_ia: Node = $"pernocas-ia"


func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	pernocas_ia.init(self)

func _physics_process(delta: float) -> void:
	pernocas_ia.process_physics(delta)

func _unhandled_input(event: InputEvent) -> void:
	pernocas_ia.process_input(event)

func _process(delta: float) -> void:
	pernocas_ia.process_frame(delta)
