extends Node

var highscores = "res://DB/Highscores.json"

var player_name = ""
var enemies_killed = 0
var time_survived = 0


func save_highscore():
	var player_highscores := {
		"name": player_name,
		"enemies_killed": enemies_killed,
		"time_survived": time_survived
	}
	
	
	var save_file = FileAccess.open(highscores, FileAccess.WRITE)
	save_file.store_var(player_highscores)

func load_highscore():
	if FileAccess.file_exists(highscores):
		var save_file = FileAccess.open(highscores, FileAccess.READ)
		return save_file.get_var()
		
	return null
