extends Node2D

@onready var interaction_area = $InteractionArea
@onready var anim = $Sprite2D/AnimationPlayer
@export var unlocked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	interaction_area.interact = Callable(self, "_unlock")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unlock():
	
	if unlocked == false && Global.gpa >= 0.20:
		anim.play("unlock")
		interaction_area.action_name = "open "
		unlocked = true
	if unlocked == false && Global.gpa < 0.20:
		interaction_area.action_name = "GPA TOO LOW "


func _on_interaction_area_player_exited() -> void:
	if unlocked == false:
		interaction_area.action_name = "... "
