extends NavigationRegion2D


func _on_child_order_changed() -> void:
	print("h")
	bake_navigation_polygon(true)
