extends Node

var enemiesCount = 0
var time = 0

func load_data_to_highscore():
	HighScores.time_survived = time
	HighScores.enemies_killed = enemiesCount
