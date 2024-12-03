extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var direction=1
const speed= 130.0
const JUMP_VELOCITY = -250.0
const potions = {
	"red_potion": preload("res://scenes/red_potion.tscn")
}

func throwPotion(potion):
	var instance = potions[potion].instantiate()
	instance.position=position
	#instance=RigidBody2D.new() #used only to case RigidBody2D to instance for autocomplete
	print(direction)
	instance.linear_velocity=velocity
	instance.linear_velocity[0]+=150*direction
	instance.linear_velocity[1]+=-200
	instance.angular_velocity=45.0
	get_parent().add_child(instance)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if not animated_sprite_2d.is_playing():
		animated_sprite_2d.play("move")
	if direction==1:
		animated_sprite_2d.flip_h=false
		velocity.x = direction * speed
	elif direction==-1:
		animated_sprite_2d.flip_h=true
		velocity.x = direction * speed
	else:
		direction=1
		velocity.x = move_toward(velocity.x, 0, speed)
		animated_sprite_2d.stop()
	if Input.is_action_just_pressed("potionThrow"):
		throwPotion("red_potion")
	move_and_slide()
