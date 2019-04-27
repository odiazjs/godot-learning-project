extends RigidBody2D

export var max_force = 200
export var max_jump_force = 200
export var acceleration = 10000
export var jump_animation_threshold = 0.1

const DIRECTION = {
	ZERO = Vector2(0, 0),
	RIGHT = Vector2(1, 0),
	LEFT = Vector2(-1, 0),
	UP = Vector2(0, -1),
	DOWN = Vector2(0, 1)
}

var directional_force: Vector2 = Vector2()

func _integrate_forces(state):
	# The final force to apply
	var force_to_apply: Vector2 = Vector2()
	# Set default IDLE direction when not moving
	directional_force = DIRECTION.ZERO
	# Apply force on body when changing
	apply_force(state)
	# Set final force
	force_to_apply = state.get_linear_velocity() + (directional_force * acceleration)
	
	if (directional_force.x > 0):
		force_to_apply.x = clamp(force_to_apply.x, -max_force, max_force)
	elif (directional_force.x < 0):
		force_to_apply.x = clamp(force_to_apply.x, -max_force, 0)
	if (directional_force.y < 0):
		force_to_apply.y = clamp(force_to_apply.y, -max_jump_force, 0)

	state.set_linear_velocity(force_to_apply)
	
func apply_force(state):
	pass
