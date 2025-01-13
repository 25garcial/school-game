extends Area2D
var speed=25
var target= Vector2(0,0)
var type=""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir = global_position.direction_to(target) 
	var movement_amount = speed * delta 
	position+=dir*movement_amount
	


func _on_timer_timeout() -> void:
	queue_free()
