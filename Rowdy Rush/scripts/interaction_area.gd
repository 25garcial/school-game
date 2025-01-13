extends Area2D
class_name InteractionArea

@export var action_name: String = "..."
signal player_exited 

var interact: Callable = func():
	pass
	
#https://youtu.be/ajCraxGAeYU for the turtorial 


func _on_body_entered(body):
	InteractionManager.register_area(self)
	

func _on_body_exited(body):
	InteractionManager.unregister_area(self)
	emit_signal("player_exited")
