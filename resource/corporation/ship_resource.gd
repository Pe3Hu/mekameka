class_name ShipResource extends Resource


var corporation: CorporationResource:
	set = set_corporation

var current_angle: float
var current_acceleration: float
var clearance: float = 1.0 / 12
var speed: float = 50
var velocity: Vector2


func set_corporation(corporation_: CorporationResource) -> ShipResource:
	corporation = corporation_
	corporation.ships.append(self)
	roll_angle()
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
