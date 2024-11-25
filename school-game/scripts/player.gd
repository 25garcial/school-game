extends CharacterBody2D


const speed= 130.0
const JUMP_VELOCITY = -250.0
const potions = {
	"red_potion": preload("res://scenes/red_potion.tscn")
}

func throwPotion(potion):
	var instance = potions[potion].instantiate()
	instance.position=position
	#instance=RigidBody2D.new() #used only to case RigidBody2D to instance for autocomplete
	instance.linear_velocity=velocity
	instance.linear_velocity[0]+=150
	instance.linear_velocity[1]+=-200
	instance.angular_velocity=45.0
	get_parent().add_child(instance)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	top_down_movement(delta)
	side_movement(delta)
	move_and_slide()

func side_movement(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("potionThrow"):
		throwPotion("red_potion")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

func top_down_movement(_delta):
	var current_dir="none"
	if Input.is_action_pressed("right"):
		current_dir = "right"
		play_anim(1,current_dir)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("left"):
		current_dir = "left"
		play_anim(1,current_dir)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("down"):
		current_dir = "down"
		play_anim(1,current_dir)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("up"):
		current_dir = "up"
		play_anim(1,current_dir)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_anim(0,current_dir)
		velocity.x = 0
		velocity.y = 0

func play_anim(movement, current_dir):
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
