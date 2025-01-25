extends RigidBody2D

# Speed and movement settings
var max_speed: float = 300
var acceleration: float = 800
var deceleration: float = 600
var velocity: Vector2 = Vector2.ZERO
var boost_multiplier: float = 1.5

func _process(delta):
	var input_vector = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized()

	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)

	# Boost handling
	if Input.is_action_pressed("boost"):
		velocity *= boost_multiplier

	linear_velocity = velocity
