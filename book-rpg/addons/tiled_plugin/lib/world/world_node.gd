@icon("../../assets/icon.svg")
@tool
class_name WorldNode extends Node2D
## use this node to store your maps

@export var maps:Array[TiledMap] = []

@export_category("External Resource")
## external world file
## can be used when you don't want to add packed scenes
@export var world:WorldResource =null
## if [code]true[/code], node will load maps from world resource 
## on ready
@export var load_on_ready:bool = false
@onready var _group = $CanvasGroup
signal map_added(map:Node)## emitted when a map_node is added
signal map_removed(map:Node)
signal map_loaded(map:Node)
## for 
## 
var current_map: Node2D
func clear()->void: ## clears canvas group
	if _group.get_child_count(false) > 0:
		var stuff = _group.get_children()
		for c in stuff:
			c.queue_free()
	pass

func load_map(dict:Dictionary):
	var path = dict.get("filePath")
	var map = load(path)		
	pass
func get_map_by_index(index:int): ## get map by index
	if index >= 0 and index < _group.get_child_count(false):
		return _group.get_child(index)
	else:
		return null
func get_map(dict):
	pass
#func set_map()
func get_save_data():
	return
func _ready():
	if load_on_ready == true:
		pass # ADD ALL MAPs

func on_ready() -> void:
	if world != null:
		print(world)
		pass
	pass # Replace with function body.
func on_child_entered_tree(node: Node) -> void:
	pass # Replace with function body.


func on_child_exiting_tree(node: Node) -> void:
	pass # Replace with function body.


func on_property_list_changed() -> void:
	pass # Replace with function body.
