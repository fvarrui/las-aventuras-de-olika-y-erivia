extends KinematicBody2D

# This script controls player movement

const UP = Vector2(0,-1)

var motion = Vector2()

export var speed = 200
export var gravity = 40
export var jump_force = -600

func _ready():
	$sprite.animation = "idle"
	
func _physics_process(delta):
	motion.y += gravity
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_force
	
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
	elif Input.is_action_pressed("ui_right"):
		motion.x = speed
	else:
		motion.x = 0
	
	move_and_slide(motion, UP)
