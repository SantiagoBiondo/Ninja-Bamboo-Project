extends Control

func _process(delta: float) -> void:
	on_spacebar_pressed()

func on_spacebar_pressed():
	if Input.is_action_pressed("ui_up"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
