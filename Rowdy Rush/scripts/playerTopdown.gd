extends CharacterBody2D

const speed = 260
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)
	move_and_slide()

func player_movement(_delta):
	var move_input = Vector2.ZERO
	
	# Check input for horizontal and vertical movement
	if Input.is_action_pressed("right"):
		move_input.x += 1
		current_dir = "right"
	if Input.is_action_pressed("left"):
		move_input.x -= 1
		current_dir = "left"
	if Input.is_action_pressed("down"):
		move_input.y += 1
		current_dir = "down"
	if Input.is_action_pressed("up"):
		move_input.y -= 1
		current_dir = "up"

	# Normalize the vector to ensure consistent speed in all directions (including diagonals)
	if move_input.length() > 0:
		move_input = move_input.normalized()

	# Apply the velocity based on the input direction
	velocity = move_input * speed

	# If no input, stop and play idle animation
	if move_input == Vector2.ZERO:
		play_anim(0)

	else:
		play_anim(1)

func play_anim(movement):
	var anim = $AnimatedSprite2D
	
	# Play the appropriate animation based on the direction
	if current_dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("moving_right")
		elif movement == 0 and current_dir == "right":
			anim.play("idle_right")

	elif current_dir == "left":
		anim.flip_h = false  # Flip horizontally for left movement
		if movement == 1:
			anim.play("moving_left")
		elif movement == 0:
			anim.play("idle_left")

	elif current_dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("moving_down")
		elif movement == 0:
			anim.play("idle_down")

	elif current_dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("moving_up")
		elif movement == 0:
			anim.play("idle_up")
