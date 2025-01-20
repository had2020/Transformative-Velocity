extends Node3D

func teleport():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_area_3d_area_entered(area: Area3D) -> void:
	teleport()


func _on_area_3d_body_entered(body: Node3D) -> void:
	teleport()


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	teleport()


func _on_area_3d_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	teleport()
