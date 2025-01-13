extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var effect_timer: Timer = $"effect timer"

var direction=1
var speed= 130.0
var JUMP_VELOCITY = -250.0
var effects=[] #[name:string, duration:int, "increaseBy:float]
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
	
func apply_effect(type, strength,duration=0):
	if type=="slow":
		if not max(speed-strength,0):
			strength+=speed-strength
		speed=max(speed-strength,0)
		if duration:
			effects.push_front(["slow", duration,strength])

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


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_effect_timer_timeout() -> void:
	for effect in effects:
		print(effect)
		effect[1]-=1
		if effect[1]==0:
			apply_effect(effect[0], effect[2]*-1)
			effects.pop_at(effects.find(effect))
	print(speed)
		


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("projectile"):
		if area.type=="ice":
			apply_effect("slow", 50, 10)
		area.queue_free()
		pass # Replace with function body.
