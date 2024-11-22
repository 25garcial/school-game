extends CharacterBody2D


const SPEED = 130.0
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
	get_parent().add_child(instance)

func _physics_process(delta: float) -> void:
	# Add the gravity.
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
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
