class_name CorporationResource extends Resource


var ships: Array[ShipResource]
var headquarter_position: Vector2 
var cosmos: CosmosResource:
	set = set_cosmos


func set_cosmos(cosmos_: CosmosResource) -> CorporationResource:
	cosmos = cosmos_
	cosmos.corporations.append(self)
	roll_headquarter_position()
	init_ships()
	return self
	
func roll_headquarter_position() -> void:
	Global.rng.randomize()
	var x = Global.rng.randf_range(-0.5, 0.5)
	Global.rng.randomize()
	var y = Global.rng.randf_range(-0.5, 0.5)
	#headquarter_position = Vector2(x, y) * cosmos.action_zone * 0.75
	
func init_ships() -> void:
	var n = 1
	
	for _i in n:
		add_ship()
	
func add_ship() -> void:
	var ship = ShipResource.new()
	ship.set_corporation(self)
