extends CharacterBody2D

var speed = 500

var dt = 0.0
func _process(delta):
	dt += delta
	var movement = Input.get_vector("left","right","up","down")
	velocity = movement * speed
	move_and_slide()
	if movement != Vector2.ZERO:
		$Icon.global_rotation = deg_to_rad(clamp(cos(dt * 9) * -60,-5,5))
	else:
		$Icon.global_rotation = 0
