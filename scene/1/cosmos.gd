class_name Cosmos extends Node2D


@export var world: World
@export var borderlines: Node2D
@export var ships: Node2D
@export var trajectories: Node2D

@onready var borderline_scene = preload("res://scene/1/borderline.tscn")
@onready var ship_scene = preload("res://scene/2/ship.tscn")

var resource: CosmosResource


func _ready() -> void:
	resource = CosmosResource.new()
	position = Global.vec.size.window.center
	
	init_borderlines()
	init_corporations()
	
func init_borderlines() -> void:
	for side in resource.borderlines:
		var borderline_resource = resource.borderlines[side]
		add_borderline(borderline_resource)
	
func add_borderline(resource_: BorderlineResource) -> void:
	var borderline = borderline_scene.instantiate()
	borderline.set_cosmos(self).set_resource(resource_)
	
func init_corporations() -> void:
	for corporation_resource in resource.corporations:
		for ship_resource in corporation_resource.ships:
			add_ship(ship_resource)
	
func add_ship(resource_: ShipResource) -> void:
	var ship = ship_scene.instantiate()
	ship.set_resource(resource_).set_cosmos(self)
