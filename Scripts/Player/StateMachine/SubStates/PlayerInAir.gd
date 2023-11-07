extends State

@export var aerial_move_speed : float

func physicsupdate_state(_delta: float):
	
	player.set_x_velocity(aerial_move_speed * player.x_input)
	if player.is_on_floor():
		if player.x_input == 0:
			state_has_changed.emit(self, "PlayerIdle")
		else:
			state_has_changed.emit(self, "PlayerMove")
	
	
