extends Node2D

@onready var get_ready = $GetReady
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
	get_ready.hide()
	create_pipe()
	pipe_generator.start()

func _game_over():
	get_tree().call_group("backgrounds", "_stop_moving")
	get_tree().call_group("pipes", "_stop_moving")
	pipe_generator.stop()
