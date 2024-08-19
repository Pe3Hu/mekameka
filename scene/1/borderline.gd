class_name Borderline extends Line2D


@export var area: Area2D
@export var collision_shape: CollisionShape2D

var cosmos: Cosmos:
	set = set_cosmos
var resource: BorderlineResource:
	set = set_resource


func set_resource(resource_: BorderlineResource) -> Borderline:
	resource = resource_
	var shape = SegmentShape2D.new()
	shape.a = resource.vertexs[0]
	shape.b = resource.vertexs[1]
	collision_shape.shape = shape
	points = resource.vertexs
	width = cosmos.resource.borderline_width
	cosmos.borderlines.add_child(self)
	return self
	
func set_cosmos(cosmos_: Cosmos) -> Borderline:
	cosmos = cosmos_
	return self
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	body.position = resource.get_looped_position(body.position)
