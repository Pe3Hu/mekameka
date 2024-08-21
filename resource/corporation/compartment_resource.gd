class_name CompartmentResource extends Resource


var ship: ShipResource:
	set = set_ship
var grid: Vector2i:
	set = set_grid
var type: String
var ring: int


func set_grid(grid_: Vector2i) -> CompartmentResource:
	grid = grid_
	ring = max(abs(grid.x), abs(grid.y))
	return self
	
func set_ship(ship_: ShipResource) -> CompartmentResource:
	ship = ship_
	ship.compartments.append(self)
	init_type()
	return self
	
func init_type() -> void:
	#var types = ["gun", "pump", "engine"]
	if ship.compartment_dimensions.x == ring:
		type = "cover"
	elif ring == 0 or ring == 1:
		type = "storage"
	else:
		if abs(grid.x) == 0 or abs(grid.y) == 0:
			type = "engine"
		elif abs(grid.x) == 1 or abs(grid.y) == 1:
			type = "pump"
		elif abs(grid.x) == 2 or abs(grid.y) == 2:
			type = "gun"
	
