extends CharacterBody2D

const FLAP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity_on = false
var dead = false
signal died

func _ready():
	pass

func _physics_process(delta):
	# Add the gravity.
	if gravity_on and not dead:
		velocity.y += gravity * delta
		if velocity.y < 0 and rotation > -PI / 4:
			rotate(-PI / 32)
		elif velocity.y > 5 and rotation < PI / 4:
			rotate(PI / 32)
			
		move_and_slide()

func _on_root_flap():
	if not dead:
		gravity_on = true	
		velocity.y = FLAP_VELOCITY
		$Flap.play()

func _on_ground_body_entered(body):
	velocity.y = 0
	dead = true
	died.emit()
	$Crash.play()
