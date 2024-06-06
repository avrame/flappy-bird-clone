extends Sprite2D

@export var speed = -10
const x_offset = -3
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


func _on_ground_body_entered(body):
	should_move = false
