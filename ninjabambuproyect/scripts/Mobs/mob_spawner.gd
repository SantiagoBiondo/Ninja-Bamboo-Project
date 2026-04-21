extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval := 1.0

func _ready():
	$Timer.wait_time = spawn_interval
	$Timer.start()
	$Timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
