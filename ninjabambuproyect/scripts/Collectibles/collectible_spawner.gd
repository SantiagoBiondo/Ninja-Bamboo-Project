extends Node2D

@export var collectible_scene: PackedScene
@export var collectible_shuriken: PackedScene
@export var spawn_interval := 5

func _ready():
	$Timer.wait_time = spawn_interval
	$Timer.start()
	$Timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	var collectible = collectible_scene.instantiate()
	add_child(collectible)
	var colectible2 = collectible_shuriken.instantiate()
	add_child(colectible2)
