extends State

class_name PlayerGroundedState
var current_air_time : float
var coyote_time : float = 0.1


func physicsupdate_state(_delta: float):
	
	current_air_time += _delta
	if player.is_on_floor():
		current_air_time = 0
	
	if current_air_time > coyote_time:
		state_has_changed.emit(self, "playerinair")
	
	if Input.is_action_just_pressed("jump") and current_air_time < coyote_time:
		state_has_changed.emit(self, "playerjump")
		return
	
	
