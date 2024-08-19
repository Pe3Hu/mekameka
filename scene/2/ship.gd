class_name Ship extends Node2D


@onready var trajectory_scene = preload("res://scene/2/trajectory.tscn")

var cosmos: Cosmos:
	set = set_cosmos
var resource: ShipResource:
	set = set_resource
var trajectory: Trajectory


func set_resource(resource_: ShipResource) -> Ship:
	resource = resource_
	return self
	
func set_cosmos(cosmos_: Cosmos) -> Ship:
	cosmos = cosmos_
	cosmos.ships.add_child(self)
	position = resource.corporation.headquarter_position
	
	trajectory = trajectory_scene.instantiate()
	trajectory.set_ship(self)
	return self
	
func _physics_process(delta_: float) -> void:
	resource.current_angle += resource.current_acceleration * delta_
	resource.update_velocity()
	position += resource.velocity * delta_
