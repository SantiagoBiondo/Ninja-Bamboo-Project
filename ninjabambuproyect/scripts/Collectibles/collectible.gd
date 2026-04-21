extends Area2D

@export var speed = 400
@export var rotation_speed = 200

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _process(delta):
	position.y += speed * delta
	rotation += rotation_speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		queue_free()
