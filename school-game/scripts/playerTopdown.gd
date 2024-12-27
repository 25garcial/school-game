extends CharacterBody2D

const speed = 400
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)
	move_and_slide()

func player_movement(_delta):
	
	if Input.is_action_pressed("right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("moving_right")
		elif movement == 0:
			anim.play("idle")

	if dir == "left":
		anim.flip_h = false
		if movement == 1:
			anim.play("moving_left")
		elif movement == 0:
			anim.play("idle")

	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("moving_forward")
		elif movement == 0:
			anim.play("idle")

	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("moving_backward")
		elif movement == 0:
			anim.play("idle")
