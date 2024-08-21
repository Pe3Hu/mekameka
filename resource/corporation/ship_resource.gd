class_name ShipResource extends Resource


var corporation: CorporationResource:
	set = set_corporation
var compartments: Array[CompartmentResource]

var current_angle: float
var current_acceleration: float
var clearance: float = 1.0 / 12
var speed: float = 50
var velocity: Vector2
var compartment_dimensions: Vector2i

const compartment_size = Vector2(6, 6)


func set_corporation(corporation_: CorporationResource) -> ShipResource:
	corporation = corporation_
	corporation.ships.append(self)
	roll_angle()
	init_compartments()
	return self
	
func roll_angle() -> void:
	Global.rng.randomize()
	current_angle = Global.rng.randf_range(0, PI * 2)
	Global.rng.randomize()
	current_acceleration = PI * 2 * clearance#Global.rng.randf_range(-PI * 2, PI * 2) * clearance
	update_velocity()
	
func update_velocity() -> void:
	velocity = Vector2.from_angle(current_angle) * speed
	
	if current_angle > PI * 2:
		current_angle = current_angle - PI * 2
	
	if current_angle < -PI * 2:
		current_angle = PI * 2 - current_angle
	
func init_compartments() -> void:
	var n = 1 
	compartment_dimensions = Vector2i.ONE * (n + 2)
	
	for y in range(-compartment_dimensions.y, compartment_dimensions.y + 1, 1):
		for x in range(-compartment_dimensions.x, compartment_dimensions.x + 1, 1):
			var grid = Vector2i(x, y)
			var compartment = CompartmentResource.new()
			compartment.set_grid(grid).set_ship(self)
