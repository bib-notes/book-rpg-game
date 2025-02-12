@tool
class_name TiledProjectImporter extends EditorImportPlugin
func _get_importer_name() -> String:
	return "Tiled World Importer"
func _get_preset_count() -> int:
	return 0
func _get_priority() -> float:
	return 2
func _get_import_order() -> int:
	return ResourceImporter.ImportOrder.IMPORT_ORDER_DEFAULT
func _get_option_visibility(path: String, option_name: StringName, options: Dictionary) -> bool:
	return false
func _get_visible_name() -> String:
	return "tiled project"
func _get_resource_type() -> String:
	return "Resource"
func _get_save_extension() -> String:
	return "tres"
func _get_recognized_extensions() -> PackedStringArray:
	return PackedStringArray(["tiled-project"])
func _get_import_options(path: String, preset_index: int) -> Array[Dictionary]:
	return [{name="defaults",default_value = true}]
func _import(source_file: String, save_path: String, options: Dictionary, platform_variants: Array[String], gen_files: Array[String]):
	print("Importing project: ",source_file)
	if !FileAccess.file_exists(source_file):
		printerr("Import file '" + source_file + "' not found!")
		return ERR_FILE_NOT_FOUND
	var file:FileAccess = FileAccess.open(source_file,FileAccess.READ)
	var raw_text: String = file.get_as_text()
	var data = JSON.parse_string(raw_text)
	var project = JSON.new()
	project.parse(data)	
	var ret = ResourceSaver.save(project, save_path+"."+_get_save_extension())
	return ret
