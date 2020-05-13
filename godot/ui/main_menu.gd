extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("ui_select") or event.is_action_pressed("ui_accept"):
		init_game()

func _on_play_button_pressed():
	init_game()

func init_game():
	Global.init_game()
	get_tree().change_scene("res://levels/level1.tscn")
