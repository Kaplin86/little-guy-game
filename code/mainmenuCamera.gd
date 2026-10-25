extends Camera2D

func _process(delta: float) -> void:
	offset =( get_viewport().get_mouse_position() - Vector2((Vector2i(1152,648) / 2))) / 5
	print(get_viewport().get_mouse_position())
