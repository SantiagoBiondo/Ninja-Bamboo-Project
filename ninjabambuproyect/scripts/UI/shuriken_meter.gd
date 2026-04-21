extends ReferenceRect

func _ready() -> void:
	pass
	
func setShurikenMeter(value):
	if value == 3:
		for a in get_children():
			a.visible = true
	elif value == 2:
		$Sprite2D.visible = false
	elif value == 1:
		$Sprite2D.visible = false
		$Sprite2D2.visible = false
	else:
		$Sprite2D.visible = false
		$Sprite2D2.visible = false
		$Sprite2D3.visible = false
