extends "res://movement_controller_2D.gd"

var can_jump = true

func _ready():
	# Override max force properties
	# acceleration = 10000
	max_jump_force = 400
	yield(get_node("AnimatedSprite"), "animation_finished")

func apply_force(state):
	if (Input.is_action_pressed("ui_right")):
		if (Input.is_action_pressed("ui_select") && can_jump):
			directional_force += DIRECTION.UP
			jump_animation_threshold -= state.get_step()
		else:
			directional_force += DIRECTION.RIGHT
		$AnimatedSprite.flip_h = false
	if (Input.is_action_pressed("ui_left")):
		if (Input.is_action_pressed("ui_select") && can_jump):
			directional_force += DIRECTION.UP
			jump_animation_threshold -= state.get_step()
		else:
			directional_force += DIRECTION.LEFT
		$AnimatedSprite.flip_h = true
	if (Input.is_action_pressed("ui_select") && can_jump):
		directional_force += DIRECTION.UP
	elif (Input.is_action_just_released("ui_select")):
		can_jump = false

func animate (delta):
	
	if(jump_animation_threshold < 0):
		can_jump = false
		jump_animation_threshold = 0.1
	
	if(can_jump):
		if(directional_force == DIRECTION.ZERO):
			$AnimatedSprite.play("idle")
		if(directional_force == DIRECTION.RIGHT):
			$AnimatedSprite.play("run")
		if(directional_force == DIRECTION.LEFT):
			$AnimatedSprite.play("run")
	
	if(directional_force.y < 0):
		$AnimatedSprite.play("jump")

func _process(delta):
	animate(delta)
	print(jump_animation_threshold)

func _on_GroundChecker2D_body_entered(body):
	can_jump = true

func _on_GroundChecker2D_body_exited(body):
	can_jump = false