extends CharacterBody2D

var screen_size
@export var max_stamina := 100
@export var stamina := 100
@export var stamina_depletion_rate := 1
@export var stamina_recharge_amount := 25
@export var shuriken_scene: PackedScene
var stamina_bar
@export var speed = 400
var positions = [Vector2(246, 750), Vector2 (410 , 750),
Vector2 (566, 750), Vector2 (730, 750), Vector2 (886, 750), Vector2 (1050, 750),
Vector2 (1206, 750), Vector2 (1370, 750)]
var positions_left = [Vector2(246,750),Vector2(566,750),Vector2(886,750),Vector2(1206,750)]
var positions_right = [Vector2(410,750),Vector2(730,750),Vector2(1050,750),Vector2(1370,750)]
var current_index = 0
var shuriken_count = 3


func _ready():
	position = positions[current_index]
	update_sprite_position()
	stamina_bar = get_tree().current_scene.get_node("UI/StaminaBar")
	stamina_bar.value = stamina
	$AudioStreamPlayer.play()

func _input(event):
	if event.is_action_pressed("ui_up"):
		$AudioStreamPlayer2.play()
		if shuriken_count > 0:
			shuriken_count -= 1
			shoot()
	if event.is_action_pressed("ui_right"):
		current_index = (current_index + 1) % positions.size()
		position = positions[current_index]
		update_sprite_position()
	elif event.is_action_pressed("ui_left"):
		current_index = (current_index - 1 + positions.size()) % positions.size()
		position = positions[current_index]
		update_sprite_position()

func update_sprite_position():
	var current_position = positions[current_index]
	if current_position in positions_left:
		$AnimatedSprite2D.flip_v = false
	elif current_position in positions_right:
		$AnimatedSprite2D.flip_v = true

func shoot():
	var shuriken = shuriken_scene.instantiate()
	shuriken.position = self.position
	get_parent().add_child(shuriken)
	get_parent().updateShurikenMeter(shuriken_count)
	
func _game_over():
	get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")

func _on_timer_timeout():
	stamina -= stamina_depletion_rate
	stamina = clamp(stamina, 0, max_stamina)
	stamina_bar.value = stamina
	get_parent().updateStaminaBar(stamina)
	GameData.time += 0.3
	if stamina <= 0:
		_game_over()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Collectible"):
		stamina += stamina_recharge_amount
	elif area.is_in_group("Collectible_shuriken"):
		shuriken_count += 3
		shuriken_count = clamp(shuriken_count, 0, 3)
		get_parent().updateShurikenMeter(shuriken_count)
