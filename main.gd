extends Node2D

@onready var player = $Player
@onready var get_ready = $GetReady
@onready var game_over = $GameOver
@onready var score = $Score
@onready var score_board = $ScoreBoard
@onready var pipe_generator = $PipeGenerator
var pipe_scene = preload("res://Pipes/pipes.tscn")

signal flap()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func create_pipe():
	var pipe = pipe_scene.instantiate()
	add_child(pipe)

func _start_game():
	#get_ready.hide()
	var fade_in_get_ready = get_tree().create_tween()
	fade_in_get_ready.tween_property(get_ready, "self_modulate:a", 0, 1)
	fade_in_get_ready.tween_callback(_start_pipes)
	
func _start_pipes():
	create_pipe()
	pipe_generator.start()
	
func _restart_game():
	game_over.hide()
	score._reset()
	score_board._reset()
	get_ready.self_modulate.a = 1
	player._reset()
	get_tree().call_group("pipes", "_destroy")
	get_tree().call_group("backgrounds", "_start_moving")

func _game_over():
	get_tree().call_group("backgrounds", "_stop_moving")
	get_tree().call_group("pipes", "_stop_moving")
	pipe_generator.stop()

func _on_player_hit_ground():
	_game_over()
	game_over._start_timer()
	score_board._start_timer()
	score_board._set_score(score._get_score())

func _on_player_hit_pipe():
	_game_over()
