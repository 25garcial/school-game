extends CharacterBody2D

var speed=5000
var target= Vector2(0,0)
var type="ice"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir = global_position.direction_to(target) 
	var movement_amount = speed * delta 
	#position+=dir * movement_amount
	velocity=dir*movement_amount
	move_and_slide()


func _on_timer_timeout() -> void:
	self.queue_free()
