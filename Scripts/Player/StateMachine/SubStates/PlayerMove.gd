extends PlayerGroundedState
class_name PlayerMove

@export var move_speed : float

func enter_state():
	pass

	
func update_state(_delta: float):
	super.update_state(_delta)
	player.set_x_velocity(move_speed * player.x_input)
	if player.x_input == 0:
		state_has_changed.emit(self, "PlayerIdle")
	
