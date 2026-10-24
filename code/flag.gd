extends Sprite2D


func _on_area_2d_body_entered(body):
	if body is KidNode:
		win()

func win():
	$CanvasLayer.visible = true
	$CanvasLayer/Node2D.modulate = Color.TRANSPARENT
	var newTween = create_tween()
	newTween.tween_property($CanvasLayer/Node2D,"modulate",Color.WHITE,0.2)
	$CanvasLayer/Node2D/CPUParticles2D.emitting = true
	$"CanvasLayer/Node2D/KidsCheering".play()
	await get_tree().create_timer(5).timeout
	
