extends Node2D

func _ready() -> void:
	$shopmenu.visible = false
func _process(_delta: float) -> void:
	pass
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_shop_method"):
		$shopmenu.visible = true
		GobalPlayer.canshop = true


func _on_area_2d_body_exited(_body: Node2D) -> void:
	$shopmenu.visible = false
	GobalPlayer.canshop = false
