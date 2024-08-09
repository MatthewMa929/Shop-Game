extends Node2D

@onready var item_preloader = $ItemPreloader

@onready var rng = RandomNumberGenerator.new()

var item_dict = {}

func _ready():
	print(get_item("Apple"))

func get_item(item_name: String) -> Item:
	return item_preloader.get_resource(item_name)

func update_item_dict() -> void:
	pass

func recieve_item(item: Item) -> void:
	pass

func delete_item(item: Item) -> bool:
	return true

func display_items() -> void:
	for item in item_dict:
		var amt = item_dict[item]
