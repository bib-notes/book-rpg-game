@tool
class_name WorldImporter extends EditorImportPlugin
signal compiled_resource(resource: Resource)
func _get_importer_name() -> String:
	return "Tiled World Importer"
func _get_preset_count() -> int:
	return 0
func _get_priority() -> float:
	return 2
func _get_import_order() -> int:
	return ResourceImporter.ImportOrder.IMPORT_ORDER_DEFAULT
func _get_option_visibility(path: String, option_name: StringName, options: Dictionary) -> bool:
	return true
func _get_visible_name() -> String:
	return "world"
func _get_resource_type() -> String:
	return "Resource"
func _get_save_extension() -> String:
	return "tres"
func _get_recognized_extensions() -> PackedStringArray:
	return PackedStringArray(["world"])
func _get_import_options(path: String, preset_index: int) -> Array[Dictionary]:
	return [{
		name = "defaults",
		default_value = true
	},
	# if world has custom properties
	{name="custom_properties" , default_value = false, hint="for custom projects"},
	{name="map_pattern_enabled",default_value = false}
	]
func _import(source_file: String, save_path: String, options: Dictionary, platform_variants: Array[String], gen_files: Array[String]):
	print("Importing file: ",source_file)
	if !FileAccess.file_exists(source_file):
		printerr("Import file '" + source_file + "' not found!")
		return ERR_FILE_NOT_FOUND
	var file:FileAccess = FileAccess.open(source_file,FileAccess.READ)
	var raw_text: String = file.get_as_text()
	var builder = TiledCompiler.compile_world(raw_text,source_file)
	# save to resource
	var resource = WorldResource.new()
	resource.maps = convert( builder._imported_maps, TYPE_ARRAY)
	resource.onlyShowAdjacentMaps = builder._onlyShowAdjacentMaps
	resource.raw = raw_text
	var ret = ResourceSaver.save(resource, save_path+"."+_get_save_extension())
	print("Import status: ", ret)
	return ret
