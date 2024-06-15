extends CharacterBody2D

const FLAP_VELOCITY = -300.0

@onready var _animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity_on = false
var dead = false
var hit_pipe = false
var first_flap = true
signal first_flap_signal
signal hit_pipe_signal
signal hit_ground_signal
signal inc_score_signal

func _ready():
	_animated_sprite.play()

func _physics_process(delta):
	if Input.is_action_just_pressed("Flap"):
		_flap()
	# Add the gravity.
	if gravity_on and not dead:
		velocity.y += gravity * delta
		if velocity.y < 0 and rotation > -PI / 4:
			rotate(-PI / 32)
		elif velocity.y > 5 and rotation < PI / 4:
			rotate(PI / 32)
			
		move_and_slide()

func _reset():
	position = Vector2(89, 247)
	rotation = 0
	gravity_on = false
	dead = false
	hit_pipe = false
	first_flap = true

func _flap():
	if first_flap:
		first_flap_signal.emit()
		first_flap = false
	if not dead and not hit_pipe:
		gravity_on = true	
		velocity.y = FLAP_VELOCITY
		$Flap.play()
		
func _hit_pipe():
	if not hit_pipe:
		hit_pipe = true
		_stop_animation()
		hit_pipe_signal.emit()
		$Crash.play()

func _on_ground_body_entered(body):
	velocity.y = 0
	position.y = 390
	_stop_animation()
	dead = true
	hit_ground_signal.emit()
	if not hit_pipe:
		$Crash.play()

func _stop_animation():
	_animated_sprite.stop()
	_animated_sprite.frame = 1
	
func _increment_score():
	inc_score_signal.emit()
	$ScorePoint.play()
