extends CharacterBody2D

const FLAP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var game_started = false

func _physics_process(delta):
	# Add the gravity.
	if game_started:
		velocity.y += gravity * delta

	move_and_slide()


func _on_root_flap():
	game_started = true
	velocity.y = FLAP_VELOCITY
