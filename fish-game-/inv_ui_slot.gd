extends Panel
@export var number:int
@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display

func update():
	if GobalPlayer.inv.items.size() < number:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = GobalPlayer.inv.items[number - 1].image
func _process(_delta: float) -> void:
	update()
