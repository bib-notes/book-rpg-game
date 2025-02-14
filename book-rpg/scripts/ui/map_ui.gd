extends Control
@onready var map_viewport = %MapViewport
@onready var map_marker_win = $MarkerWindow
@onready var map_options = $MapOptions
var has_mouse:bool
func _process(_delta):
	if Input.is_action_just_released("map_zoom_in"):
		if has_mouse == true:
			map_viewport.zoom_in()
	if Input.is_action_just_released("map_zoom_out"):
		if has_mouse == true:
			map_viewport.zoom_out()
	pass


func _on_map_container_mouse_exited() -> void:
	has_mouse = false
	print("not has mouse")
	pass # Replace with function body.

func _load():
	
	pass
func _on_map_container_mouse_entered() -> void:
	has_mouse = true
	print("has mouse")
	
	pass # Replace with function body.
func focus_entered():
	pass
func focus_exited():
	pass


func _on_map_input(event: InputEvent) -> void:
	#print("Event: ",event)
	if event is InputEventMouseButton:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				if event.pressed == true:
					
					pass # TODO: set map cursor
			MOUSE_BUTTON_RIGHT:
				if event.pressed == true:
					pass
			MOUSE_BUTTON_WHEEL_DOWN:
				if event.pressed == true:
					map_viewport.zoom_in()
					pass
			MOUSE_BUTTON_WHEEL_UP:
				if event.pressed == true:
					map_viewport.zoom_out()
					pass
	elif event is InputEventMouseMotion:
		match event.button_mask:
			MOUSE_BUTTON_MASK_LEFT:# drag map
				map_viewport.drag_map(event.velocity)
				#if event.velocity.x !=0 and event.velocity.y !=0:
					#pass## TODO: DRAG MAP
				pass
			
	pass # Replace with function body.


func _on_hidden() -> void:

	pass # Replace with function body.


func _on_map_focus_entered() -> void:
	pass # Replace with function body.
func _ready():
	
	pass
