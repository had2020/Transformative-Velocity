extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()


func restart():
	get_tree().reload_current_scene()

func _on_lava_area_entered(area: Area3D) -> void:
	restart()


func _on_lava_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	restart()


func _on_lava_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	restart()


func _on_lava_body_entered(body: Node3D) -> void:
	restart()
