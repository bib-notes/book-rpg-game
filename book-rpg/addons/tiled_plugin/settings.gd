@tool
class_name TiledSettings
const PROJECT_FILE_SETTING = "Tiled/project/project_file"
const AUTOMAPPING_RULES_FILE = "Tiled/project/auto_mapping_rules_file"
const SETTINGS_CONFIGURATION = {
	PROJECT_FILE = {
		value = null,
		type = TYPE_OBJECT,
		hint = "tiled project file path"
	},
	
	
	
}
static func prepare():
	#ProjectSettings.set_setting("application")
	#ProjectSettings.
	pass
static func create():
	#ProjectSettings.set_setting(settings.PROJECT_FILE_SETTING,null)
	var map:Dictionary={
		project_file = PROJECT_FILE_SETTING,
	}
	for key: String in SETTINGS_CONFIGURATION:
		var setting_config: Dictionary = SETTINGS_CONFIGURATION[key]
		var setting_name: String = "tiled/%s" % key
		if not ProjectSettings.has_setting(setting_name):
			ProjectSettings.set_setting(setting_name, setting_config.value)
		ProjectSettings.set_initial_value(setting_name, setting_config.value)
		
		ProjectSettings.add_property_info({
			"name" = setting_name,
			"type" = setting_config.type,
			"hint" = setting_config.get("hint", PROPERTY_HINT_NONE),
			"hint_string" = setting_config.get("hint_string", "")
		})
		ProjectSettings.set_as_basic(setting_name, not setting_config.has("is_advanced"))
		ProjectSettings.set_as_internal(setting_name, setting_config.has("is_hidden"))

		print("Setting: ",key)
	ProjectSettings.save()
	pass
static func set_setting(key: String, value) -> void:
	if get_setting(key, value) != value:
		ProjectSettings.set_setting("tiled/%s" % key, value)
		ProjectSettings.set_initial_value("tiled/%s" % key, SETTINGS_CONFIGURATION[key].value)
		ProjectSettings.save()
static func get_setting(key: String, default):
	if ProjectSettings.has_setting("tiled/%s" % key):
		return ProjectSettings.get_setting("tiled/%s" % key)
		
	else:
		return default
static func get_settings(only_keys: PackedStringArray = []) -> Dictionary:
	var settings: Dictionary = {}
	for key in SETTINGS_CONFIGURATION.keys():
		if only_keys.is_empty() or key in only_keys:
			settings[key] = get_setting(key, SETTINGS_CONFIGURATION[key].value)
	return settings
