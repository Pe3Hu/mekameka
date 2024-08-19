class_name BorderlineResource extends Resource


var cosmos: CosmosResource:
	set = set_cosmos
var side: String:
	set = set_side
var vertexs: Array[Vector2]
var anchor: Vector2


func set_cosmos(cosmos_: CosmosResource) -> BorderlineResource:
	cosmos = cosmos_
	return self
	
func set_side(side_: String) -> BorderlineResource:
	side = side_
	init_vertexs()
	cosmos.borderlines[side] = self
	return self
	
func init_vertexs() -> void:
	var orientation = Global.dict.orientation[side]
	var index = Global.arr.windrose.find(side) / 2
	var first = Vector2()
	var second = Vector2()
	
	match orientation:
		"vertical":
			anchor.x = (cosmos.action_zone.x + cosmos.borderline_width) / 2
			#anchor.x = cosmos.action_zone.x / 2
			first.y = -(cosmos.action_zone.y + cosmos.borderline_width) / 2
			second.y = (cosmos.action_zone.y + cosmos.borderline_width) / 2
		"horizontal":
			anchor.y = (cosmos.action_zone.y + cosmos.borderline_width) / 2
			#anchor.y = cosmos.action_zone.y / 2
			first.x = -(cosmos.action_zone.x + cosmos.borderline_width) / 2
			second.x = (cosmos.action_zone.x + cosmos.borderline_width) / 2
	
	if index == 1:
		anchor *= -1
	
	vertexs.append(first + anchor)
	vertexs.append(second + anchor)
	
func get_looped_position(position_: Vector2) -> Vector2:
	var orientation = Global.dict.orientation[side]
	var looped_position = Vector2(position_)
	var mirrored_borderline = cosmos.borderlines[Global.dict.mirror[side]]
	var index = Global.arr.windrose.find(side) / 2
	var shift = Vector2()
	
	match orientation:
		"vertical":
			looped_position.x = mirrored_borderline.anchor.x
			shift.x = cosmos.borderline_width
		"horizontal":
			looped_position.y = mirrored_borderline.anchor.y
			shift.y = cosmos.borderline_width
	
	if index == 1:
		shift *= -1
	
	looped_position += shift
	return looped_position
