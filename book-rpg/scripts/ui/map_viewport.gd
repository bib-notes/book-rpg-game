##
## This is for processing the map
##
extends SubViewport
const MARKER_UI = preload("res://data/ui/map_marker.tscn")
@onready var marker_container =%MapMarkers
@onready var camera = %MapCam
@onready var cursor = %MapCursor
@onready var map_node = %MapNode

const ZOOM_MIN = 0.125
const ZOOM_MAX = 2
const ZOOM_FACTOR = 0.025
var zoom = 1## camera zoom
var has_mouse:bool = false

func zoom_in():
	if camera.zoom.x < ZOOM_MAX:
		camera.zoom.x += ZOOM_FACTOR
		camera.zoom.y += ZOOM_FACTOR
	pass
func zoom_out():
	if camera.zoom.x > ZOOM_MIN:
		camera.zoom.x -= ZOOM_FACTOR
		camera.zoom.y -= ZOOM_FACTOR
	pass
func set_cam_pos(pos:Vector2):
	camera.position = pos
	pass
func set_cursor_pos(pos:Vector2):
	cursor.position = pos
func add_marker(data:Dictionary,pos:Vector2):
	var marker_label = data.get("marker_label")
	var marker_color  = data.get("marker_color")
	var marker_icon  = data.get("marker_icon")
	var marker_note  = data.get("marker_note")
	var marker = MARKER_UI.instantiate()
	
	pass
func remove_marker(id):
	pass
func new_marker(marker_name,pos:Vector2):
	var marker = MARKER_UI.instantiate()
	marker.set_te
	return marker
func load_map(m):
	## get tiled map layers
	
	pass
func drag_map(val:Vector2):
	var cam_zoom = camera.zoom
	#camera.dra
	camera.drag_horizontal_offset = val.x * camera.zoom.x*-1
	camera.drag_vertical_offset = val.y*camera.zoom.y*-1
	#var new_pos = camera.position
	camera.position.x += val.x
	camera.position.y += val.y
	pass

func _on_mouse_entered() -> void:
	has_mouse = true
	#print("Mouse entered")
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	has_mouse = false
	#print("mouse exited")
	pass # Replace with function body.
func _process(delta):
	var d_ = delta
func clear_map():
	var nodes = map_node.get_children()
	for child in nodes:
		child.free()
func clear_markers():
	var markers = marker_container.get_children()
	for m in markers:
		m.queue_free()
func process_chlidren(node):
	var _c = node.get_children(true)
	for child in _c:
		print(child)
		match child.get_class():
			"TileMapLayer":
				var _clone = child.duplicate()
				map_node.add_child(_clone)
			"Marker2D":
				var _clone = child.duplicate()
				marker_container.add_child(_clone)
			"Node2D":
				if child.get_parent() == node:
					process_chlidren(child)
			_:
				if child.get_child_count()>0:
					process_chlidren(child)
func _load(node:TiledWorld):
	print("world loaded")
	if map_node.get_child_count()>0:
		clear_map()
	if marker_container.get_child_count()>0:
		clear_markers()
	print("world: ",node)
	process_chlidren(node)
					
		#if child is TileMapLayer and child.name.begins_with("ground"):
			
	pass
func _ready() -> void:
	WorldManager.world_loaded.connect(self._load)
	pass
