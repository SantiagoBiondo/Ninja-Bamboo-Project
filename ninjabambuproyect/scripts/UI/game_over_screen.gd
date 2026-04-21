extends Control

func _ready():
	$time_done.text = str(GameData.time)
	$enemies_killed.text = str(GameData.enemiesCount)
	$AudioStreamPlayer.play()
	var data = HighScores.load_highscore()
	
	if data:
		$Highscores.text = "Jugador: %s\nEnemigos: %s\nTiempo: %s" % [
			str(data["name"]),
			str(data["enemies_killed"]),
			str(data["time_survived"])
		]
	else:
		$Highscores.text = "no hay puntajes guardados"

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/control.tscn")


func _on_restart_pressed():
	GameData.enemiesCount = 0
	GameData.time = 0
	get_tree().change_scene_to_file("res://scenes/main.tscn")





func _on_line_edit_text_submitted(Player_name: String) -> void:
	HighScores.player_name = Player_name
	GameData.load_data_to_highscore()
	HighScores.save_highscore()
