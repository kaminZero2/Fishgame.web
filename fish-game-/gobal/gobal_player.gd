extends Node

var fish1 = preload("res://itemdata/fish1.tres")
var fish2 = preload("res://itemdata/fish2.tres")
var fish3 = preload("res://itemdata/fish3.tres")
var fish4 = preload("res://itemdata/fish4.tres")
var fish5 = preload("res://itemdata/fish5.tres")
var fish6 = preload("res://itemdata/fish6.tres")
var fish7 = preload("res://itemdata/fish7.tres")
var arry1 = [fish1, fish2, fish3, fish4, fish5, fish6, fish7]
var canfish = false
var canshop = false
var inv = preload("res://itemdata/playerinv.tres")

var setting = false
var win = false
var minigame = false
var cooldown = false
var chackfish = 0
var onfishing = false
var coins = 100
var Max_inv = 12
var speedarrow = -0.05
var speedc = 0.01
var item_one_owned = false
var item_two_owned = false
