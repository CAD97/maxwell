extends Node

export (PackedScene) var particle_scene

export (float) var min_velocity
export (float) var cutoff_velocity
export (float) var max_velocity

export (int) var particle_count_per_side

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	for i in range(0, particle_count_per_side):
		spawn_in_area($HotArea/CollisionShape2D)
	for i in range(0, particle_count_per_side):
		spawn_in_area($ColdArea/CollisionShape2D)

func spawn_in_area(area: CollisionShape2D):
	var extent = area.shape.extents
	var pos = area.global_position
	var bl = pos - extent
	var tr = pos + extent
	
	var spawn_x = rand_range(bl.x, tr.x)
	var spawn_y = rand_range(bl.y, tr.y)
	var velocity = rand_range(min_velocity, max_velocity)
	var angle = rand_range(0, 2*PI)
	
	var particle: RigidBody2D = particle_scene.instance() 
	particle.position = Vector2(spawn_x, spawn_y)
	particle.linear_velocity = Vector2.RIGHT.rotated(angle) * velocity
	add_child(particle)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
