extends Node2D

@onready var item_preloader = $ItemPreloader

var item_dict = {} #{ItemName: ItemAmt}

signal item_received(item, amt) 

func _ready():
	refresh_item_dict()

func get_item(item_name: String) -> Item:
	return item_preloader.get_resource(item_name)

func refresh_item_dict() -> void:
	var res_lst = item_preloader.get_resource_list()
	for i in range(res_lst.size()):
		item_dict[res_lst[i]] = 0

func receive_item(item: Item) -> void:
	item_dict[item.name] += 1
	emit_signal("item_received", item, item_dict[item.name])

func delete_item(item: Item) -> bool:
	return true

#UI SIGNALS


#PACKAGE MANAGER SIGNALS
func _on_package_manager_bunch_to_stock(bunch):
	for i in range(bunch.size()):
		receive_item(bunch[i])

#EXTRA
func _process(delta):
	if Input.is_action_just_pressed("Extra"):
		pass
		#receive_item(get_item("Apple"))
