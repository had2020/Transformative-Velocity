extends Node2D

@export var level_name = ""

func _ready() -> void:
	$Label.text = "level"+level_name
