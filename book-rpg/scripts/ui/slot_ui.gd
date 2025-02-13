class_name SlotUI extends Button
@onready var item_icon = $ItemIcon
@onready var num_label =$SlotNum
@onready var amount_label = $ItemAmount

signal selected(slot:SlotUI)
func set_amount(amount:int):## set amount label text
	if amount < 0:
		amount_label.text = "0"
	else:
		amount_label.text = str(amount)
func set_slot_num(num:int):
	num_label.text = str(num)
func set_icon(image: Texture2D):
	item_icon.texture = image
	
func toggle_num_label(v:bool):
	num_label.visible = v
func toggle_amount_label(v:bool):
	amount_label.visible = v
func select():
	selected.emit(self)
	pass
