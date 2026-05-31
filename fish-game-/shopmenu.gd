extends StaticBody2D

var item1 = 1
var item_one_price = 100
var item_two_price = 250


var price

@onready var icon = $icon
@onready var price_label = $PriceLabel

func _ready() -> void:
	$icon.play("upgatearrow")
	item1 = 1

func _physics_process(_delta: float) -> void:
	if self.visible == true:
		if item1 == 1:
			$icon.play("upgatearrow")
			$PriceLabel.text = "100"
		if item1 == 2:
			$icon.play("upgatecircle")
			$PriceLabel.text = "200"

func _on_button_pressed() -> void:
	swap_item_back()


func _on_button_2_pressed() -> void:
	swap_item_forward()


func _on_buybuttom_pressed() -> void:
	if item1 == 1:
		price = item_one_price
		if GobalPlayer.coins >= price:
			if GobalPlayer.item_one_owned == false:
				buy()
	elif item1 == 2:
		price = item_two_price
		if GobalPlayer.coins >= price :
			if GobalPlayer.item_two_owned == false:
				buy()

func swap_item_back():
	if item1 == 1:
		item1 = 2
	elif item1 == 2:
		item1 = 1

func swap_item_forward():
	if item1 == 1:
		item1 = 2
	elif  item1 == 2:
		item1 = 1
		

func buy():
	GobalPlayer.coins -= price
	if item1 == 1:
		GobalPlayer.item_one_owned = true
	if item1 == 2:
		GobalPlayer.item_two_owned = true
