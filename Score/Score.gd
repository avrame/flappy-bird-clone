extends Label

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_inc_score_signal():
	score += 1
	text = str(score)
	
func _get_score():
	return score
	
func _reset():
	score = 0
	text = "0"
