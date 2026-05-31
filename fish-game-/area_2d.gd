extends Area2D




func _on_area_entered(_area: Area2D) -> void:
	GobalPlayer.canfish = true


func _on_area_exited(_area: Area2D) -> void:
	GobalPlayer.canfish = false
