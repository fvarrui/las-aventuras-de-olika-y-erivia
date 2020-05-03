extends Node2D

const world_limit = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		exit()

func _process(delta):
	if get_node("nira").get_position().y > world_limit:
		exit()

func exit():
	get_tree().quit()
