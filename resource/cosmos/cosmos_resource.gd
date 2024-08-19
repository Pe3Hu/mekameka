class_name CosmosResource extends Resource


var corporations: Array[CorporationResource]
var borderlines: Dictionary
var action_zone = Vector2(1200, 600)
var borderline_width = 40


func _init() -> void:
	init_borderlines()
	init_corporations()
	pass
	
func init_borderlines() -> void:
	for side in Global.arr.windrose:
		var borderline = BorderlineResource.new()
		borderline.set_cosmos(self).set_side(side)
	
func init_corporations() -> void:
	var n = 1
	
	for _i in n:
		var corporation = CorporationResource.new()
		corporation.set_cosmos(self)
