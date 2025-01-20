extends VehicleBody3D


var STEER_SPEED = 1.5
var STEER_LIMIT = 0.6
var steer_target = 0
var steer_button_target = 0
var engine_force_value = 150

var up:bool = false
var down = false
var left = false
var right = false


func _physics_process(delta):
	var speed = linear_velocity.length()*Engine.get_frames_per_second()*delta
	traction(speed)
	$Hud/speed.text=str(round(speed*3.8))

	var fwd_mps = transform.basis.x.x
	steer_target = Input.get_action_strength("left") - Input.get_action_strength("right")
	steer_target += steer_button_target
	steer_target *= STEER_LIMIT
	if Input.is_action_pressed("backward") or down:

		if speed < 20 and speed != 0:
			engine_force = clamp(engine_force_value * 3 / speed, 0, 300)
		else:
			engine_force = engine_force_value
	else:
		engine_force = 0
	if Input.is_action_pressed("foward") or up:
		if fwd_mps >= -1:
			if speed < 30 and speed != 0:
				engine_force = -clamp(engine_force_value * 10 / speed, 0, 300)
			else:
				engine_force = -engine_force_value
		else:
			brake = 1
	else:
		brake = 0.0
		
	if Input.is_action_pressed("ui_select"):
		brake=3
		$wheal2.wheel_friction_slip=0.8
		$wheal3.wheel_friction_slip=0.8
	else:
		$wheal2.wheel_friction_slip=3
		$wheal3.wheel_friction_slip=3
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)
	
	if Input.is_action_pressed("esc"):
		get_tree().quit()



func traction(speed):
	apply_central_force(Vector3.DOWN*speed)


func _on_up_button_button_up() -> void:
	up = false

func _on_down_button_button_up() -> void:
	down = false

func _on_down_button_button_down() -> void:
	down = true

func _on_up_button_button_down() -> void:
	up = true


func _on_left_button_button_down() -> void:
	steer_button_target = 1;

func _on_right_button_button_down() -> void:
	steer_button_target = -1;

func _on_left_button_button_up() -> void:
	steer_button_target = 0;

func _on_right_button_button_up() -> void:
	steer_button_target = 0;




func _on_restart_bp_pressed() -> void:
	get_tree().reload_current_scene()

func _on_exit_bp_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
