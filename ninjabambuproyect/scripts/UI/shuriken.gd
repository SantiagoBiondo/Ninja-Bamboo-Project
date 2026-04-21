extends Area2D
@export var speed = 1200
@export var rotation_speed = 200


func _process(delta):
	position.y -= speed * delta
	rotation += rotation_speed * delta

func _on_area_entered(area):
	queue_free()
