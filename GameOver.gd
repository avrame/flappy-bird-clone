extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self_modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_player_died():
	var fade_in = get_tree().create_tween()
	fade_in.tween_property(self, "self_modulate:a", 1, 1.5)
	fade_in.parallel().tween_property(self, "position:y", position.y - 10, 1.5).set_trans(Tween.TRANS_SPRING)
