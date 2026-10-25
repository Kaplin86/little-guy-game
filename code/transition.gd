extends Node

func transitionToScene(path):
	var tween1 = create_tween()
	tween1.tween_property($CanvasModulate,"color",Color.BLACK,1)
	await tween1.finished
	get_tree().change_scene_to_file(path)
	tween1 = create_tween()
	tween1.tween_property($CanvasModulate,"color",Color.WHITE,1)
