extends State
class_name PlayerAbilityState

@export var state_animation_time : float
var current_animation_time : float
var is_ability_done = false

func enter_state():
	current_animation_time = 0.0
	is_ability_done = false

func update_state(_delta: float):
	current_animation_time += _delta
	if current_animation_time > state_animation_time:
		is_ability_done = true
		print("Ability is done")
