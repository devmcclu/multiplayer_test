extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 100
var rotation_speed = 80
var max_speed = 150

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	#If user presses up key, then move forward
	if Input.is_action_pressed("ui_up"):
		add_force(Vector2(0,0), Vector2(cos(rotation), sin(rotation)) * delta * speed)
	
	#limit the velocity to max speed
	if get_linear_velocity().length() > max_speed:
		set_linear_velocity(get_linear_velocity().normalized()*max_speed)
	
	#If the user presses left, then rotate left
	if Input.is_action_pressed("ui_left"):
		set_angular_velocity(-rotation_speed * delta)
	#If the user presses right, then rotate right
	if Input.is_action_pressed("ui_right"):
		set_angular_velocity(rotation_speed * delta)