extends Node2D

export var limit = 1

func _ready():
	if Global.lives < limit:
		$sprite.animation = "off"
	else:
		$sprite.animation = "on"

func _process(delta):
	_ready()
