class_name Trajectory extends Line2D


var ship: Ship:
	set = set_ship
var next_angle: float
var next_acceleration: float
var clearance: float = 1.0 / 12
var velocity: Vector2

const max_points = 300
const delta = 1.0 / 20


func set_ship(ship_: Ship) -> void:
	ship = ship_
	ship.cosmos.trajectories.add_child(self)
	update_points()
	
func update_points() -> void:
	clear_points()
	var vertex = ship.position
	next_angle = ship.resource.current_angle
	next_acceleration = ship.resource.current_acceleration
	
	for _i in max_points:
		add_point(vertex)
		next_angle += next_acceleration * delta
		vertex += velocity
		velocity = Vector2.from_angle(next_angle) * ship.resource.speed * delta
