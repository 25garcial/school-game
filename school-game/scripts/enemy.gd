extends Node2D

@onready var ray_cast_right: RayCast2D = $rayCastRight
@onready var ray_cast_left: RayCast2D = $rayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $slime_animated_sprite
var frozen=true
var direction=1
var health=100
var armor=100
var damage=10
var type="slime"

func _ready() -> void:
	animated_sprite_2d.play("spawn")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if frozen:
		return
	if not ray_cast_right.is_colliding():
		direction=-1
		animated_sprite_2d.flip_h=true
	if not ray_cast_left.is_colliding():
		direction=1
		animated_sprite_2d.flip_h=false
	self.position.x+=60*delta*direction


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_script()==preload("res://scripts/red_potion.gd"):
		health-=50
		animated_sprite_2d.play("damage")


func _on_slime_animated_sprite_animation_finished() -> void:
	animated_sprite_2d.play("move")
	frozen=false # Replace with function body.
	if health<1:
		queue_free()
