extends Sprite2D

@onready var swoosh_sound = $Swoosh
@onready var show_timer = $ShowTimer
# Called when the node enters the scene tree for the first time.
func _ready():
	self_modulate.a = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _start_timer():
	show_timer.start()

func _show_game_over():
	swoosh_sound.play()
	var fade_in = get_tree().create_tween()
	fade_in.tween_property(self, "self_modulate:a", 1, 1.5)
	fade_in.parallel().tween_property(self, "position:y", position.y - 10, 1.5).set_trans(Tween.TRANS_SPRING)
