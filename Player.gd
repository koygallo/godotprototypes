extends CharacterBody2D

const SPEED = 100

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("move")
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("move")
	else:
		$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_portal_body_entered(body):
	var playerData = get_node("/root/PlayerData")
	#save player current position
	playerData.set_player_last_pos(position)
	
	#go to new scene
	get_tree().change_scene_to_file("res://interior.tscn")
