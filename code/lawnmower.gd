@tool
extends Sprite2D
class_name Lawnmower

var running = false

enum direction {East,West,North,South}

@export var CurrentDir : direction = direction.East


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is KidNode or body is BigRobertNode or (body.get_parent() is Lawnmower and body.get_parent() != self):
		run()

func run():
	running = true

var speed = 180
func _process(delta: float) -> void:
	if CurrentDir in [direction.East,direction.North]: 
		flip_h = false
		$CPUParticles2D.scale = Vector2.ONE
	if CurrentDir in [direction.West,direction.South]: 
		flip_h = true
		$CPUParticles2D.scale = Vector2(-1,1)
	$CPUParticles2D.emitting = running
	
	if !Engine.is_editor_hint():
		if running:
			
			speed *= 1 + delta * 2 
			var dir = Vector2.ZERO
			match CurrentDir:
				direction.East:
					dir = Vector2(1,0)
				direction.West:
					dir = Vector2(-1,0)
				direction.North:
					dir = Vector2(0,-1)
				direction.South:
					dir = Vector2(0,1)
			global_position += dir * delta * speed


func _on_kill_area_body_entered(body: Node2D) -> void:
	if running:
		if body.is_in_group("brocolli"):
			body.queue_free()
