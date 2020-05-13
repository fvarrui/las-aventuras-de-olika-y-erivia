extends Node2D

const world_y_limit = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://ui/main_menu.tscn")

func _process(delta):
	if $player.get_position().y > world_y_limit:
		if !$player.is_dead():
			$player.die()
			$restart_timer.start()

func _on_restart_timer_timeout():
	if Global.lives > 0:
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene("res://ui/main_menu.tscn")
