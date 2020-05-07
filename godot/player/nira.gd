extends KinematicBody2D

# This script controls player movement

const UP = Vector2(0,-1)

var dead = false
var motion = Vector2()

export var can_fly = false
export var speed = 600
export var gravity = 40
export var jump_force = -800


func _ready():
	$sprite.animation = "idle"
	
func _physics_process(delta):
	motion.y += gravity
	
	if !dead:
		if is_on_floor() or can_fly:
			if Input.is_action_just_pressed("ui_accept"):
				$sounds/hop.play()
				motion.y = jump_force
		
		if Input.is_action_pressed("ui_left"):
			motion.x = -speed
		elif Input.is_action_pressed("ui_right"):
			motion.x = speed
		else:
			motion.x = 0
	
	move_and_slide(motion, UP)

