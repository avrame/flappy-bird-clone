extends Node2D

var window_width
var window_height
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	var window_size = DisplayServer.window_get_size()
	window_width = window_size[0]
	window_height = window_size[1]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _draw():
	draw_rect(Rect2(0, 0, window_width, window_height), Color.WHITE)
	
func _flash():
	visible = true
	timer.start()

func _on_timer_timeout():
	visible = false
