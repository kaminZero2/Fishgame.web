extends HSlider


@export var audio_bus_name: String

var audio_bus_id

func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)

func _process(_delta: float) -> void:
	if not GobalPlayer.setting:
		$"..".visible = false
	else:
		$"..".visible = true
func _on_value_changed(_value: float) -> void:
	var db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id, db)


func _on_options_pressed() -> void:
	$"..".visible = false
	GobalPlayer.setting = false
