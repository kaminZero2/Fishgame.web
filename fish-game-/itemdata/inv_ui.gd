extends Control

@onready var inv: Inv = preload("res://itemdata/playerinv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
var is_open = false

func _ready() -> void:
	print(inv.items)
	#update_slots()
	close()

#func update_slots():
	#for i in range(min(inv.items.size(), slots.size())):
		#slots[i].update(inv.items[i])
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("tab"):
		if is_open:
			close()
		else:
			open()
	#update_slots()

func open():
	visible = true
	is_open = true
func close():
	visible = false
	is_open = false
