extends Node2D

@onready var interaction_area = $InteractionArea
@export var text = "Mrs. Taylor "

func _ready() -> void:
	interaction_area.interact = Callable(self, "_read")


func _read():
	interaction_area.action_name = text
	


func _on_interaction_area_player_exited() -> void:
	interaction_area.action_name = "... "
