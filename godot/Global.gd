extends Node

var lives = 0

func init_game():
	lives = 3
	
func _input(event):
	if Input.is_action_just_pressed("ui_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		get_tree().quit()
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		Input.action_press("ui_cancel")
