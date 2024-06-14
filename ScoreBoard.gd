extends Sprite2D

@onready var show_timer = $ShowTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _start_timer():
	show_timer.start()

func _slide_up():
	var slide_up = get_tree().create_tween()
	slide_up.tween_property(self, "position:y", 243, 0.5)
