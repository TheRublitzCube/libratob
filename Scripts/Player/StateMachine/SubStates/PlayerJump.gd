extends PlayerAbilityState

@export var jump_velocity : float

func enter_state():
	print("Player has entered " + self.name.to_lower() + " state")
	player.set_y_velocity(-jump_velocity)

func update_state(_delta: float):
	super.update_state(_delta)
	if is_ability_done == true:
		state_has_changed.emit(self, "playerinair")
	
