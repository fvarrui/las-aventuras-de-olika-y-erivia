extends Node2D

const world_y_limit = 1000
var time = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://ui/main_menu.tscn")

func _process(delta):
	if $player.get_position().y > world_y_limit:
		time += delta
		$end_game_timer.start()
		if !$player/sounds/aaah.playing:
			$player/sounds/aaah.play()
		elif time > 0.25:
			get_tree().reload_current_scene()
		

func _on_end_game_timer_timeout():
	get_tree().reload_current_scene()
