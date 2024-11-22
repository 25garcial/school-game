extends Node2D

const SPEED=60
@onready var left: RayCast2D = $left
@onready var right: RayCast2D = $right

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !left.is_colliding():
		position.x+= SPEED * delta
