extends StaticBody2D
class_name Spikes

var textureUp = preload("res://art/spikeon.tres")
var textureDown = preload("res://art/spikeoff.tres")

@export var inverted = false

var on = false:
	set(state):
		if on != state:
			on = state
			stateCheck(on)

func stateCheck(state):
	var trueState = state
	if inverted: trueState = !state
	get_child(0).disabled = trueState
	get_parent().bake_navigation_polygon(true)
	
	if trueState:
		get_child(1).texture = textureDown
	else:
		get_child(1).texture = textureUp

func _ready() -> void:
	stateCheck(on)
