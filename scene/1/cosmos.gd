class_name Cosmos extends PanelContainer


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
		var borderline = borderline_scene.instantiate()
		borderline.set_cosmos(self).set_resource(borderline_resource)
	
func init_corporations() -> void:
	for corporation_resource in resource.corporations:
		for ship_resource in corporation_resource.ships:
			var ship = ship_scene.instantiate()
			ship.set_resource(ship_resource).set_cosmos(self)
