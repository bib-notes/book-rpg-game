class_name CompiledWorld extends RefCounted
var maps := []

## data for storing resource
var data:Dictionary = {}
var raw_text:String = ""
var errors = []
#region internal Vars
var import_paths:PackedStringArray = []
var _imported_maps:Array = []
var _onlyShowAdjacentMaps: bool = false
var _map:Dictionary = {}
## 
var _imported_data = {}
## error compilation errors
 #var errors:Array[Dictionary] = []
#endregion

func compile(text:String,source_file:String):
	
	maps = []
	if FileAccess.file_exists(source_file):
		# check extension
		if source_file.get_extension() == WorldResource.EXTENSION:
			raw_text = text
			_imported_data =  JSON.parse_string(text)
			if typeof(_imported_data) == TYPE_DICTIONARY:
				if _imported_data.has("maps"):
					var _maps:Array = _imported_data.get("maps")
					var i:int = 1
					for m in _maps:
						parse_map(m,i,source_file)
						i += 1
						pass
				if _imported_data.has("onlyShowAdjacentMaps"):
					_onlyShowAdjacentMaps = _imported_data.get("onlyShowAdjacentMaps")
				else:
					_onlyShowAdjacentMaps = false
				pass
	pass
func parse_map(map_data:Dictionary, i:int,source:String ):
	var result = {}
	var config = TiledPluginContants.TILED_MAP_CONFIG
	var keys = config.keys()
	var valid_map= false
	for key in keys:
		var prop = config.get(key)
		var prop_name = prop.id
		var prop_type = prop.type
		if map_data.has(prop.id):
			var p = map_data.get(prop.id)
			result.get_or_add(prop_name,p)
			valid_map=true
			if prop_name == "fileName":
				# check if file exists
				var map_path = get_map_path(p,source)
				var map_name = source.get_basename()
				result.get_or_add("id",map_name)
				
				result.get_or_add("filePath",map_path)
				if is_valid_map(map_path):
					valid_map=true
					result.get_or_add("filePath",map_path)
					
				else:
					valid_map=false
					var error = "Parsing Error: map["+str(i)+"] fileName is invalid. please make sure filepath is correct"
					errors.append(error)
				pass
		#else:
			
	if valid_map == true:# add to maps if valid
		if maps.size()<i:
			_imported_maps.append(result)
		else:
			_imported_maps[i-1]=result
	#return result
func is_valid_map(path:String):
	var valid = false
	if FileAccess.file_exists(path):
		valid = true
	return  valid

## get path of map file
## XXX: File path should be relative to world file
func get_map_path(map_file:String,source:String):
	var _base_path = source.get_base_dir()
	var _map_path = _base_path.path_join(map_file)
	return _map_path
## Get 
func build_map_patterns(patterns:Array):
	var pattern
	var map_pattern
	return 
