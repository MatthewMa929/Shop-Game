extends Node2D

@onready var item_preloader = $ItemPreloader

@onready var rng = RandomNumberGenerator.new()

signal display_bunch(bunch: Array[Item])
signal bunch_to_stock(bunch: Array[Item])

var curr_bunch: Array[Item] = []
var bunch_size = 5


func get_random_item() -> Item:
	var item_arr = item_preloader.get_resource_list()
	return item_preloader.get_resource(item_arr[rng.randi_range(0, item_arr.size()-1)])
	
func create_bunch() -> Array[Item]:
	curr_bunch.clear()
	for i in range(bunch_size):
		curr_bunch.append(get_random_item())
	return curr_bunch


#UI Signals
func _on_ui_reroll_pressed():
	emit_signal("display_bunch", create_bunch())

func _on_ui_bunch_bought():
	emit_signal("bunch_to_stock", curr_bunch)


#EXTRA
func _process(delta):
	if Input.is_action_just_pressed("Extra"):
		pass
		#emit_signal("display_bunch", create_bunch())
