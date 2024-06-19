extends Node2D

var window_width
var window_height
signal mid_fade
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	var window_size = DisplayServer.window_get_size()
	window_width = window_size[0]
	window_height = window_size[1]
	self_modulate.a = 0

func _draw():
	draw_rect(Rect2(0, 0, window_width, window_height), Color.BLACK)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _fade_in():
	var fade_in_tween = get_tree().create_tween()
	fade_in_tween.tween_property(self, "self_modulate:a", 1, 0.5)
	fade_in_tween.tween_callback(_mid_fade)
	
func _fade_out():
	var fade_out_tween = get_tree().create_tween()
	fade_out_tween.tween_property(self, "self_modulate:a", 0, 0.5)

func _mid_fade():
	mid_fade.emit()
	timer.start()
