extends Node2D

@onready var get_ready = $GetReady

signal flap()

var game_started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Flap"):		
		flap.emit()
		if not game_started:
			start_game()
		
func start_game():
	get_ready.hide()
	game_started = true
