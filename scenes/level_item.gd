extends Node2D

@export var level_num = ""

func _ready() -> void:
	$Label.text = "level: "+level_num


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_"+level_num+".tscn")
