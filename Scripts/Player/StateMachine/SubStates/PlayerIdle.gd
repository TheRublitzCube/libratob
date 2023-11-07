extends PlayerGroundedState
class_name PlayerIdle


func enter_state():
	super.enter_state()
	player.set_x_velocity(0.0)
	
func update_state(_delta: float):
	super.update_state(_delta)
	if player.x_input != 0.0:
		state_has_changed.emit(self, "PlayerMove")
