extends Node2D

var dt = 0.0
func _process(delta):
	dt += delta
	var num = 0
	if wrap(dt,0,0.3) <= 0.01:
		for I : Sprite2D in get_children():
			num +=1 
			I.offset = Vector2(sin(dt * num),cos( dt * num * 2)) * 2
