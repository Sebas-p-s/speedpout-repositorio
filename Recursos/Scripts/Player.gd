extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var appeared:bool = false
var leaved_floor: bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	if is_on_floor():
		leaved_floor = false
	
	# Add the gravity.
	if not is_on_floor():
		if not leaved_floor:
			$Time.start()
			leaved_floor = true
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and right_to_jump():
		$jumpaud.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	decide_animation()

func decide_animation():
	#Eje x
	if velocity.x == 0:
		$Animation.play("idle")
	elif velocity.x < 0:
		$Animation.flip_h = true
		$Animation.play("run")
	elif velocity.x > 0:
		$Animation.flip_h = false
		$Animation.play("run")
	
	#Eje y
	if velocity.y > 0:
		$Animation.play("fall")
	if velocity.y < 0:
		$Animation.play("jump_up")

func right_to_jump():
	if is_on_floor(): return true
	elif not $Time.is_stopped(): return true


func oveja_on_time_timeout():
	pass



