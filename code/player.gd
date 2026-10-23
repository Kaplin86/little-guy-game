extends CharacterBody2D

var speed = 500

func _process(delta):
	var movement = Input.get_vector("left","right","up","down")
	global_position += movement * delta * speed
