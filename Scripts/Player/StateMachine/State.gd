extends Node
class_name State

signal state_has_changed
@onready var player = get_node("/root/Node2D/Player")

func enter_state():
	print("Player has entered " + self.name.to_lower() + " state")

func exit_state():
	print("Player has exited " + self.name.to_lower() + " state")
	
func update_state(_delta: float):
	pass
	
func physicsupdate_state(_delta: float):
	pass
