extends CharacterBody2D

@export var Player : CharacterBody2D
@export var navAgent : NavigationAgent2D

enum Modes {Wander, Follow, StayPut}

var Mode : Modes = 1

var TimePassedWander = 0.0
var TargetLocation : Vector2 = Vector2.ZERO

var BASEspeed = 200
var speedRamp = 100

var maxPLYRdist = 120

var dt = 0.0
func _process(delta):
	dt += delta
	var speed = BASEspeed + (sin(dt * 5) * speedRamp)
	
	if Input.is_action_just_pressed("command"):
		Mode = wrap(Mode + 1, 0, 3)
		print(Mode as Modes)
	
	if Mode == Modes.Wander:
		TimePassedWander += delta
		if randi_range(0,TimePassedWander) > 2:
			TargetLocation = global_position + Vector2(randi_range(-50,50),randi_range(-50,50))
			TimePassedWander = 0
	elif Mode == Modes.Follow:
		
		if global_position.distance_to(Player.global_position) > maxPLYRdist:
			TargetLocation = Player.global_position + (Player.global_position.direction_to(global_position) * maxPLYRdist)
	
	navAgent.target_position = TargetLocation
	var pos = navAgent.get_next_path_position()
	global_position += global_position.direction_to(pos) * min(speed * delta,global_position.distance_to(pos))
