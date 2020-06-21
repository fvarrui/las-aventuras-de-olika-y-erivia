extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_visible(OS.has_touchscreen_ui_hint())
	print(OS.has_touchscreen_ui_hint())
