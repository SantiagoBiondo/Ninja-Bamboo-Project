extends Control


func _ready() -> void:
	$AudioStreamPlayer.play()

func _on_iniciar_partida_pressed():
	get_tree().change_scene_to_file("res://scenes/tutorial_screen.tscn")


func _on_cargar_partida_pressed() -> void:
	pass # Replace with function body.


func _on_salir_pressed() -> void:
	get_tree().quit()


func _on_mouse_entered():
	$AudioStreamPlayer.play()
