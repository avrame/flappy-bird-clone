extends Sprite2D

const RADIUS = 11

@onready var sparkle = $Sparkle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _place_sparkle_randomly():
	var r = RADIUS * sqrt(randf())
	var theta = randf() * 2 * PI
	var x = r * cos(theta)
	var y = r * sin(theta)
	sparkle.position = Vector2(x, y)
	sparkle.play()
