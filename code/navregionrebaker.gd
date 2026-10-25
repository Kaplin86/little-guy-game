extends NavigationRegion2D


func _on_child_order_changed() -> void:
	bake_navigation_polygon(true)
