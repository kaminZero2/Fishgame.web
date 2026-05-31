extends Node2D


func _ready() -> void:
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_2_timeout() -> void:
	$"../Timer2".start()
	$".".rotate(1)
