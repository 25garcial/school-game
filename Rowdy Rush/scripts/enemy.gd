extends Node2D

@onready var ray_cast_right: RayCast2D = $rayCastRight
@onready var ray_cast_left: RayCast2D = $rayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction=1
	if not ray_cast_left.is_colliding():
		direction=1
		animated_sprite_2d.flip_h=false
	if not ray_cast_right.is_colliding():
		direction=-1
		animated_sprite_2d.flip_h=true
	self.position.x+=60*delta*direction
	pass
