class_name Ship extends Node2D


@export var compartments: Node2D

@onready var trajectory_scene = preload("res://scene/2/trajectory.tscn")
@onready var compartment_scene = preload("res://scene/2/compartment.tscn")

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
	init_compratments()
	return self
	
func init_compratments() -> void:
	for compratment_resource in resource.compartments:
		var compartmen = compartment_scene.instantiate()
		compartmen.set_resource(compratment_resource).set_ship(self)
	
func _physics_process(delta_: float) -> void:
	resource.current_angle += resource.current_acceleration * delta_
	resource.update_velocity()
	position += resource.velocity * delta_
