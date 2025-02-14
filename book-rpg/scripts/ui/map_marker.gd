class_name MapMarker extends Marker2D
var data:Dictionary
@onready var label:Label = $MarkerLabel
@onready var marker:TextureRect = $Icon
func set_label(text):
	label.text= text
func set_icon(image:Texture2D):
	marker.texture = image
func toggle_label(v:bool)->void:
	label.visible = v
func _init() -> void:
	pass
