extends KinematicBody2D

var config: Config = preload("res://Config.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var angle_diff = get_angle_to(get_global_mouse_position())
	rotation += clamp(angle_diff, -config.paddle_turn_speed * 2 * PI, config.paddle_turn_speed * 2 * PI)
	rotation_degrees = clamp(rotation_degrees, -75, 75)
