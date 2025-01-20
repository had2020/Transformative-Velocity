extends RigidBody3D

const Speed = 1
const torque_multiplier = 0.1

const Turn_rate = 0.1

var max_steering_angle = 45.0 
var steering_speed = 5.0 

var current_steering_angle = 0.0

func _process(delta: float) -> void:
	var steering_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	var target_steering_angle = max_steering_angle * steering_input
	current_steering_angle = lerp(current_steering_angle, target_steering_angle, steering_speed * delta)

func _input(event: InputEvent) -> void:
	
	if event.is_action("foward"):
		var transform = self.global_transform
		apply_central_impulse(-transform.basis.z * Speed)
	
	if event.is_action("backward"):
		var transform = self.global_transform
		apply_central_impulse(transform.basis.z * Speed)
	
	if event.is_action("left"):
		self.apply_torque(Vector3(0,Turn_rate,0))
		#apply_torque(-Vector3(0, current_steering_angle * torque_multiplier, 0))
	
	if event.is_action("right"):
		self.apply_torque(Vector3(0,-Turn_rate,0))
		#apply_torque(-Vector3(0, current_steering_angle * torque_multiplier, 0))
		
	
	if event.is_action("esc"):
		get_tree().quit()
	
	if event.is_action("esc"):
		Globals.viewpoint = !Globals.viewpoint
