extends Node2D

@onready var item_preloader = $ItemPreloader
@onready var item_spr = $ItemSpr

var stock_pos = Vector2(28, 46)
var stock_ptr = stock_pos
var stock_amt = 0

var package_pos = Vector2(66, 148)
var package_ptr = package_pos
var package_spr_arr = []

var stock_amt_div = 7

signal change_bunch_cost(price)

func display_item_on_stock(item: Item) -> void:
	var new_spr = item_spr.duplicate()
	new_spr.texture = item.texture
	if stock_amt % stock_amt_div == 0 and stock_amt != 0: #Will put a cap later
		stock_ptr = stock_pos
		stock_ptr.y += 32 * stock_amt / stock_amt_div
	new_spr.position = stock_ptr
	add_child(new_spr)

func display_bunch(bunch: Array[Item]) -> void:
	for i in range(bunch.size()):
		var item = bunch[i]
		var new_spr = item_spr.duplicate()
		new_spr.texture = item.texture
		new_spr.position = package_ptr
		add_child(new_spr)
		package_spr_arr.append(new_spr)
		package_ptr.x += 36
	display_price(bunch)

func clear_package_spr_arr() -> void:
	for spr in package_spr_arr:
		spr.queue_free()
	package_spr_arr.clear()
	package_ptr = package_pos

func display_price(bunch: Array[Item]) -> void:
	var price = 0
	for i in range(bunch.size()):
		price += bunch[i].price
	emit_signal("change_bunch_cost", price)

func _on_stock_manager_item_received(item, amt):
	display_item_on_stock(item)
	stock_ptr.x += 35
	stock_amt += 1

func _on_package_manager_display_bunch(bunch):
	clear_package_spr_arr()
	display_bunch(bunch)
