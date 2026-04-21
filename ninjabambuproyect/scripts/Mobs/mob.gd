extends Area2D

var speed = MobSpeed.speed


func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _process(delta):
	position.y += speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
		queue_free()

func _on_body_entered(area):
	if area.name == "Player":
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")

func _on_area_entered(area):
	GameData.enemiesCount+=1
	$AudioStreamPlayer.play()
	queue_free()
