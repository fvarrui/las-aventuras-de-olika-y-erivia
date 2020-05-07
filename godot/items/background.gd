tool
extends ParallaxBackground

export var speed = 0.0
export(Texture) var texture

func _ready():
	get_node("ParallaxLayer/background1").texture = texture
	get_node("ParallaxLayer/background2").texture = texture

func _process(delta):
	$ParallaxLayer.motion_offset.x += speed


