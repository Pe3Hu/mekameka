class_name Compartment extends CharacterBody2D


@export var polygon: Polygon2D
@export var collision_polygon: CollisionPolygon2D

var ship: Ship:
	set = set_ship
var resource: CompartmentResource:
	set = set_resource


func set_resource(resource_: CompartmentResource) -> Compartment:
	resource = resource_
	return self
	
func set_ship(ship_: Ship) -> Compartment:
	ship = ship_
	ship.compartments.add_child(self)
	init_vertexts()
	return self
	
func init_vertexts() -> void:
	position = Vector2(resource.grid) * ship.resource.compartment_size
	var vertexs = []
	
	for direction in Global.dict.direction.diagonal:
		var vertex = Vector2(direction) * ship.resource.compartment_size / 2
		vertexs.append(vertex)
	
	polygon.set_polygon(vertexs)
	polygon.color = Global.color.compartment[resource.type]
	collision_polygon.polygon = vertexs
	
func hit(bullet_: Bullet) -> void:
	queue_free()
	bullet_.queue_free()
