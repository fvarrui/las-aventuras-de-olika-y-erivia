extends KinematicBody2D

# This script controls player movement

const UP = Vector2(0,-1)

var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")
var dead = false
var motion = Vector2()
var last_position = Vector2()

export var can_fly = false
export var speed = 600
export var jump_force = -1500

func _ready():
	$sprite.animation = "idle"
	
# warning-ignore:unused_argument
func _physics_process(delta):
	motion.y += gravity
	
	# if is on floor, removes gravity
	if is_on_floor():
		motion.y = 0
	
	if !dead:
		
		# jump action
		if Input.is_action_just_pressed("ui_accept"):
			if is_on_floor() or can_fly:
				$sounds/hop.play()
				motion.y = jump_force
		
		# move right and left actions
		if Input.is_action_pressed("ui_left"):
			motion.x = -speed
			if is_on_floor() and !$sounds/steps.is_playing():
				$sounds/steps.play()
				
		elif Input.is_action_pressed("ui_right"):
			motion.x = speed
			if is_on_floor() and !$sounds/steps.is_playing():
				$sounds/steps.play()
			
		else:
			$sounds/steps.stop()
			motion.x = 0
			
	print(is_on_floor())

	move_and_slide(motion, UP)

	
func is_dead():
	return dead

func die():
	Global.lives -= 1
	dead = true
	$sounds/aaah.play()	
	
func is_moving():
	var moving = false
	if !last_position.is_equal_approx(get_position()):
		moving = true
		last_position = get_position()
	return moving
