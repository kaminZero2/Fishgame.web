extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$minigame.position = $player.position
	if $Timer.is_stopped():
		$Timer.start()
	if GobalPlayer.onfishing:
		if GobalPlayer.chackfish >= 75:
			GobalPlayer.onfishing = false
			GobalPlayer.minigame = true
	if Input.is_action_just_pressed("space") and GobalPlayer.minigame and not GobalPlayer.onfishing:
		if GobalPlayer.win:
			GobalPlayer.inv.items.append(GobalPlayer.arry1[randi_range(0, GobalPlayer.arry1.size() -1 )].duplicate())
		else:
			print("2")
		GobalPlayer.minigame = false
	if Input.is_action_just_pressed("space") and GobalPlayer.canshop:
		print(GobalPlayer.inv.items)
		for i in GobalPlayer.inv.items:
			print(i.num)
			GobalPlayer.coins += i.num
		GobalPlayer.inv.items.clear()
	


func _on_timer_timeout() -> void:
	GobalPlayer.chackfish = randi_range(0, 100)
	#print(GobalPlayer.chackfish)
	$Timer.start()
	
	
