extends KinematicBody2D

var speed = 600
onready var ball = get_parent().find_node("Ball")

func _physics_process(delta):
	var direction = Vector2(0, _get_direction())
	move_and_slide(direction * speed)

func _get_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		else:
			return -1
	else:
		return 0
