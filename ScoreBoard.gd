extends Sprite2D

@onready var show_timer = $ShowTimer
@onready var score_label = $Score
@onready var best_score_label = $BestScore
@onready var score_count = $ScoreCount
@onready var start_button = $StartButton
@onready var medal = $Medal

var final_score = 0
var best_score = 0
var score_display = 0
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
	slide_up.tween_interval(0.5)
	slide_up.tween_callback(_display_score)

func _set_score(score):
	final_score = score

func _display_score():
	if final_score > 0:
		score_count.start()
	else:
		start_button.visible = true
		start_button.disabled = false

func _on_score_count_timeout():
	score_display += 1
	score_label.text = str(score_display)
	if score_display > best_score:
		best_score_label.text = str(score_display)
		
	if score_display == final_score:
		score_count.stop()
		start_button.visible = true
		start_button.disabled = false
		if final_score > best_score:
			medal.visible = true
			medal._place_sparkle_randomly()
			best_score = final_score
		
func _reset():
	position = Vector2(144, 573)
	start_button.disabled = true
	final_score = 0
	score_display = 0
	score_label.text = "0"
	medal.visible = false
