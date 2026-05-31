extends CharacterBody2D


const SPEED = 150.0

@export var inv: Inv

var anmetion_state = 0 
var idle = true
var Max = 60.0
var p = 1
var number = 0.0
var L = false

func _physics_process(_delta: float) -> void:
	if GobalPlayer.minigame:
		$Node2D/FishingRod.visible = true
		#$Node2D/FishingRod2.visible = false
		$Node2D/FishingRod3.visible = false
	if L:
		$Node2D/FishingRod.visible = false
		$Node2D/FishingRod3.visible = true
		lua()
	
	if number >= Max and not GobalPlayer.onfishing:
		GobalPlayer.onfishing = true
		number = 0.0
	chack()
	if not GobalPlayer.minigame:
		
		walk()
	if GobalPlayer.inv.items.size() < GobalPlayer.Max_inv:
		fishing()
	setting()
	

func walk():
	
	var direction := Vector2.ZERO

	if Input.is_action_pressed("w"):
		direction.y -= 1
		idle = false
		anmetion_state = 1
		GobalPlayer.onfishing = false
		
		$Node2D/FishingRod.position = Vector2(8.116, -8.116)
		$Node2D/FishingRod2.position = Vector2(8.116, -8.116)
		$Node2D/FishingRod.rotation = 1.576
		$Node2D/FishingRod2.rotation = 1.576
		$Node2D/FishingRod.flip_h = true
		$Node2D/FishingRod2.flip_h = true
		$Node2D/FishingRod3.visible = false
	elif Input.is_action_just_released("w"):
		idle = true
	if Input.is_action_pressed("s"):
		direction.y += 1
		idle = false
		anmetion_state = 0
		GobalPlayer.onfishing = false
		$Node2D/FishingRod.position = Vector2(-8.116, 8.116)
		$Node2D/FishingRod2.position = Vector2(-8.116, 8.116)
		$Node2D/FishingRod.rotation = -1.5795
		$Node2D/FishingRod2.rotation = -1.5795
		$Node2D/FishingRod.flip_h = true
		$Node2D/FishingRod2.flip_h = true
		$Node2D/FishingRod3.visible = false
	elif Input.is_action_just_released("s"):
		idle = true
	if Input.is_action_pressed("a"):
		direction.x -= 1
		idle = false
		anmetion_state = 2
		GobalPlayer.onfishing = false
		$Node2D/FishingRod.position = Vector2(-8.116, -8.116)
		$Node2D/FishingRod2.position = Vector2(-8.116, -8.116)
		$Node2D/FishingRod.rotation = 0
		$Node2D/FishingRod2.rotation = 0
		$Node2D/FishingRod.flip_h = true
		$Node2D/FishingRod2.flip_h = true
		$Node2D/FishingRod3.visible = false
	elif Input.is_action_just_released("a"):
		idle = true
	if Input.is_action_pressed("d"):
		direction.x += 1
		idle = false
		anmetion_state = 3
		GobalPlayer.onfishing = false
		$Node2D/FishingRod.position = Vector2(8.116, -8.116)
		$Node2D/FishingRod2.position = Vector2(8.116, -8.116)
		$Node2D/FishingRod.rotation = 0
		$Node2D/FishingRod2.rotation = 0
		$Node2D/FishingRod.flip_h = false
		$Node2D/FishingRod2.flip_h = false
		$Node2D/FishingRod3.visible = false
	elif Input.is_action_just_released("d"):
		idle = true

	direction = direction.normalized()
	velocity = direction * SPEED
	move_and_slide()
func chack():
	match anmetion_state:
		0:
			if not idle:
				$AnimatedSprite2D.play("down")
			else:
				$AnimatedSprite2D.play("down_idle")
		1:
			if not idle:
				$AnimatedSprite2D.play("up")
			else:
				$AnimatedSprite2D.play("up_idle")
		2:
			if not idle:
				$AnimatedSprite2D.play("right")
			else:
				$AnimatedSprite2D.play("right_idle")
			$AnimatedSprite2D.flip_h = true
		3:
			if not idle:
				$AnimatedSprite2D.play("right")
			else:
				$AnimatedSprite2D.play("right_idle")
			$AnimatedSprite2D.flip_h = false

func fishing():
	if Input.is_action_just_pressed("e"):
		$Node2D/AnimationPlayer.play("fishing_rod")
	if (L and not GobalPlayer.minigame)or GobalPlayer.onfishing:
		$Node2D/FishingRod2.visible = true
	else:
		$Node2D/FishingRod2.visible = false
		$Node2D/FishingRod.visible = true


func setting():
	if Input.is_action_just_pressed("g"):
		if GobalPlayer.setting:
			GobalPlayer.setting = false
		elif not GobalPlayer.setting:
			GobalPlayer.setting = true

func lua():
	match anmetion_state:
		0:
			if number < Max:
				$Node2D/FishingRod3.position.y += p
		1:
			if number < Max:
				$Node2D/FishingRod3.position.y -= p
		2:
			if number < Max:
				$Node2D/FishingRod3.position.x -= p
		3:
			if number < Max:
				$Node2D/FishingRod3.position.x += p
	number += p

	if number >= Max:
		L = false

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	if GobalPlayer.canfish and not GobalPlayer.minigame and not GobalPlayer.onfishing:
		$Node2D/FishingRod3.global_position = global_position
		number = 0.0
		L = true

func player_shop_method():
	pass
