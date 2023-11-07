extends Node
class_name StateMachine

@export var initial_state : State
@export var label : Label

var current_state : State
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_has_changed.connect(on_state_change)
		else:
			push_warning("Child " + child.name + " is not a valid State or Node of StateMachine")
			
	if initial_state:
		initial_state.enter_state()
		current_state = initial_state
#		animator.play(current_state.name.to_lower())
		label.text = current_state.name
		
func on_state_change(state, _new_state_name):
	if state != current_state:
		return
		
	var new_state = states.get(_new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.exit_state()
	
	new_state.enter_state()
	current_state = new_state
#	animator.play(current_state.name.to_lower())
	label.text = current_state.name
	
