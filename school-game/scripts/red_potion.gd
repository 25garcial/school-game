extends Area2D
#function to throw a potion is in player script
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var sprite_2d: Sprite2D = $"../Sprite2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void: 	
	if area.is_in_group("enemy"):
		animated_sprite_2d.show()
		sprite_2d.hide()
		animated_sprite_2d.play()
	
func _on_animated_sprite_2d_animation_finished() -> void: #deletes itself when the animation finishes
	$"..".queue_free()# Replace with function body.
