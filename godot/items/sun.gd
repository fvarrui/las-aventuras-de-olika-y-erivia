extends Node2D

func _on_timer_timeout():
	$sprite.animation = "default"
	$sprite.play("blink")
	$timer.start()
