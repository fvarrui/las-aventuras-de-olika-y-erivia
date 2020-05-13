extends Node

var lives = 0

func init_game():
	lives = 3
	
func _input(event):
	if Input.is_action_just_pressed("ui_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
