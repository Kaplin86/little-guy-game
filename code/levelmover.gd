extends Button

@export var level = 1


func _on_pressed():
	GlobalNode.transitionToScene("res://scenes/levels/level"+str(level)+".tscn")
