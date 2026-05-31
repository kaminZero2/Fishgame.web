extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GobalPlayer.item_one_owned:
		GobalPlayer.speedc = 0
	if GobalPlayer.item_two_owned:
		GobalPlayer.speedarrow = 0.02
	$Node2D.rotate(GobalPlayer.speedc)
	$arrow.rotate(GobalPlayer.speedarrow)
	if GobalPlayer.minigame:
		visible = true
		
	else:
		visible = false



func _on_area_hitbox_area_entered(_area: Area2D) -> void:
	GobalPlayer.win = true



func _on_area_hitbox_area_exited(_area: Area2D) -> void:
	GobalPlayer.win = false
