extends Area2D

var pressed = false

@export var relevantspikes : Array[Spikes] = []

func _process(delta: float) -> void:
	$Pressed.visible = pressed
	$Big.visible = !pressed
	
	pressed = false
	for I in get_overlapping_bodies():
		if I is KidNode or I is BigRobertNode:
			pressed = true
	
	for I in relevantspikes: I.on = pressed
