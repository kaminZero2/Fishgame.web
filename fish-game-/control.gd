extends Control

@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var options: Panel = $Options

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not GobalPlayer.setting:
		v_box_container.visible = true
		options.visible = false



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://fishingmap.tscn")


func _on_settings_pressed() -> void:
	print("settings")
	GobalPlayer.setting = true
	v_box_container.visible = false
	options.visible = true
func _on_exit_pressed() -> void:
	get_tree().quit()
