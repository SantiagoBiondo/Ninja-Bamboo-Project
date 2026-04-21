extends Node2D
@export var enemy_scene: PackedScene
@export var collectible_scene: PackedScene
@export var collectible_shuriken: PackedScene
var spawn_Probabilitie = 20

func _ready() -> void:
	pass

func _on_timer_timeout() -> void:
	var number = randi() % spawn_Probabilitie
	if number >= 0 and number < 13:
		get_parent().spawnObject(instantiateMob())
	elif number >= 13 and number < 16:
		get_parent().spawnObject(instantiateCollectible())
	else: get_parent().spawnObject(instantiateShuriken())
	if GameData.time > 40:
		$Timer.wait_time = 0.7
		get_parent().spawnObject(instantiateMob())
		MobSpeed.speed = 500
	if GameData.time > 80:
		$Timer.wait_time = 0.5
	
	if GameData.time > 120:
		$Timer.wait_time = 0.3
	
	if GameData.time > 160:
		$Timer.wait_time = 0.1

func instantiateShuriken():
	return collectible_shuriken.instantiate()

func instantiateMob():
	return enemy_scene.instantiate()

func instantiateCollectible():
	return collectible_scene.instantiate()
