extends CharacterBody2D
class_name Player

#Player Data Values
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var workspace : Vector2
var current_velocity : Vector2 = Vector2(0,0)
@export var facing_direction : int = 1
var x_input : float
var grounded

@export var state_machine : StateMachine
@export var animation_tree : AnimationTree

func _ready():
	animation_tree.active = true
	grounded = false

func _process(delta):
	x_input = Input.get_axis("ui_left", "ui_right")
	if state_machine.current_state:
		#print("This is working")
		state_machine.current_state.update_state(delta)
	update_animation_parameters()

func _physics_process(delta):
	
	if is_on_floor():
		grounded = true
	else:
		grounded = false
		
	velocity.y += gravity * delta
	if state_machine.current_state:
		state_machine.current_state.physicsupdate_state(delta)
		#print(current_velocity)
	move_and_slide()


func set_x_velocity(new_velocity): 
	workspace = Vector2(new_velocity, velocity.y)
	velocity = workspace
	current_velocity = workspace
	
func set_y_velocity(new_velocity): 
	workspace = Vector2(velocity.x, new_velocity)
	velocity = workspace
	current_velocity = workspace
	
func check_if_should_flip(_x_input):
	if _x_input != 0 and _x_input != facing_direction:
		flip()

	
func flip():
	facing_direction *= -1
	
	if facing_direction == 1:
		$Player_Sprite.flip_h = false
	else:
		$Player_Sprite.flip_h = true

func update_animation_parameters():
	
	check_if_should_flip(x_input)
	
	if grounded:
		animation_tree["parameters/conditions/is_grounded"] = true
		animation_tree["parameters/conditions/is_not_grounded"] = false
	else:
		animation_tree["parameters/conditions/is_grounded"] = false
		animation_tree["parameters/conditions/is_not_grounded"] = true
		
	animation_tree["parameters/player_in_air/blend_position"] = velocity.y
	
	if velocity.x == 0.0:
		animation_tree["parameters/conditions/is_idle"] = true
		animation_tree["parameters/conditions/is_running"] = false
	else:
		animation_tree["parameters/conditions/is_idle"] = false
		animation_tree["parameters/conditions/is_running"] = true
		
