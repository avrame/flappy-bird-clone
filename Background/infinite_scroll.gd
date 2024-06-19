extends Sprite2D

@export var speed = -10
var x_offset = -3
var should_move = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if should_move:
		move_local_x(delta * speed)
		var width = texture.get_width()
		if position.x <= -width:
			position.x = width + x_offset
			x_offset -= 3

func _stop_moving():
	should_move = false

func _start_moving():
	should_move = true
