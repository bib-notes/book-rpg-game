@tool
class_name TiledEditorPlugin extends EditorPlugin
var world_importer = preload("lib/world/world_importer.gd")
var project_importer = preload("lib/project/import_plugin.gd")
var settings = preload("settings.gd")
var world_plugin
var project_plugin
var world_editor: Control
func _get_plugin_icon() -> Texture2D:
	return load("./assets/icon.svg")
func _enter_tree() -> void:
	# Initialization of the plugin goes here.

	if Engine.is_editor_hint():
		
		TiledSettings.prepare()
		world_plugin = world_importer.new()
		add_import_plugin(world_plugin)
		project_plugin = project_importer.new()
		add_import_plugin(project_plugin)
	pass

func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_import_plugin(world_plugin)
	world_plugin = null
	remove_import_plugin(project_plugin)
	project_plugin = null
func plugin_path()->String:
	return get_script().resource_path.get_base_dir()
