extends RigidBody3D

const Speed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action("foward"):
		self.apply_central_impulse(Vector3(0,0,-Speed))
	
	if event.is_action("backward"):
		self.apply_central_impulse(Vector3(0,0,Speed))
	
	if event.is_action("left"):
		self.apply_central_impulse(Vector3(-Speed,0,0))
	
	if event.is_action("right"):
		self.apply_central_impulse(Vector3(Speed,0,0))
	
	if event.is_action("esc"):
		get_tree().quit()
	
	if event.is_action("esc"):
		Globals.viewpoint = !Globals.viewpoint
