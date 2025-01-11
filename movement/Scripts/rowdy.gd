extends CharacterBody2D

@export var speed = 350
var accel: float = 8.0
var input: Vector2
var dir = "none"


func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	return input.normalized()
	
	if Input.is_action_pressed("right"):
		$Sprite2D/AnimationPlayer.play("walk_right")
	else: pass
	if Input.is_action_pressed("left"):
		dir = "left"
	if Input.is_action_pressed("down"):
		dir = "down"
	if Input.is_action_pressed("up"):
		dir = "up"

func _process(delta):
	var player_input = get_input()
	
	velocity = lerp(velocity, player_input * speed, delta * accel)
	
	move_and_slide()
	
	
