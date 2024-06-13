extends Node2D

@export var speed = -100
@onready var sprite = $SpriteTop
var should_move = true

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("pipes")
	position.x = 335
	position.y = randi() % 225 + 75

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if should_move:
		move_local_x(delta * speed)
		var width = sprite.texture.get_width()
		if position.x <= -width:
			queue_free()


func _on_pipe_entered(body):
	body._hit_pipe()
	
func _stop_moving():
	should_move = false
