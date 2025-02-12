
@icon("../../assets/icon.svg")
@tool
## Tiled World Resource
class_name WorldResource extends Resource
## resource extension
const EXTENSION = "world" 
## file format
const FILE_FORMAT = "JSON"
const SAVE_EXTENSION = "tres"
const TILED_RECOURCE_TYPE = "world"
var type = "world"
var data:JSON## for storing data
#@export_category("World Config")
## world maps
@export var maps:Array=[]
## if true, render only adjacent maps
@export var onlyShowAdjacentMaps:bool=false
## raw resource data
@export var raw: String
func set_data(json:JSON)->void:
	var _data:Dictionary = json.data
	print("type: ",typeof(_data))
	if typeof(_data) == TYPE_DICTIONARY:
		print("data is a dict")
	pass
func get_data()->JSON:
	var d = JSON.new()
	d.data = {"maps":maps,"onlyShowAdjacentMaps":onlyShowAdjacentMaps,"type":type}
	return d
## Get Map from Map Array
func get_map(id:int)->Dictionary:
	if id < len(maps):
		return maps[id]
	return {}
func _to_string() -> String:
	#return "<WorldResource id=\"%s\">" %["".join(PackedStringArray([""]))]
	return "<WorldResource#-\"%s\">" %[self.get_rid()]
