extends KinematicBody2D
class_name Ball

var speed = 0
var direction = Vector2.ZERO
var is_moving = false
onready var timer = get_parent().find_node("RestartTimer")

func _ready():
	randomize()
	reset_ball()
	
func reset_ball():
	timer.stop()

	speed = 600
	direction.x = [-1, 1][randi() % 2]
	direction.y = [-0.6, -0.8][randi() % 2]
	is_moving = true

func _physics_process(delta):
	if is_moving:
		var collide = move_and_collide(direction * speed * delta)
		
		if collide:
			direction = direction.bounce(collide.normal)
			$AudioCollision.play()


func _on_RestartTimer_timeout():
	reset_ball()
