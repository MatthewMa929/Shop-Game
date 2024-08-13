extends Control

@export var stock_ui: Container
@export var money_ui: RichTextLabel
@export var event_ui: RichTextLabel
@export var amt_ui: RichTextLabel
@export var price_ui: RichTextLabel

signal reroll_pressed
signal bunch_bought

#UI SIGNALS
func _on_reroll_pressed():
	emit_signal("reroll_pressed")

func _on_buy_button_pressed():
	emit_signal("bunch_bought")

#STOCK MANAGER SIGNALS



#ITEM DISPLAY SIGNALS
func _on_item_display_change_bunch_cost(price):
	price_ui.text = "$" + str(price)

