extends CharacterBody3D


const SPEED = 4
var hero
const JUMP_VELOCITY = 4.5
@export var turn_speed = 4.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _ready():
	hero = get_tree().get_nodes_in_group("hero")[0]


func _physics_process(delta):
	$NavigationAgent3D.set_target_position(hero.global_transform.origin)
	var velocity = ($NavigationAgent3D.get_next_path_position() - transform.origin).normalized() * SPEED * delta
	move_and_collide(velocity)
