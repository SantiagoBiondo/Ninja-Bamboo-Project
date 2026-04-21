extends CanvasLayer

func _physics_process(delta):
	if Input.is_action_just_pressed("Pausa"):
		get_tree().paused = not get_tree().paused
		$ColorRect.visible = not $ColorRect.visible
		$TextEdit.visible = not $TextEdit.visible
		$Quit.visible = not $Quit.visible

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/control.tscn")
