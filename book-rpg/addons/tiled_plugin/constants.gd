@tool
class_name TiledPluginContants
const TILED_MAP_CONFIG = {
	map_file = {id="fileName",type=TYPE_STRING,default_value = ""},
	map_pos_x = {id = "x",type=TYPE_INT,default_value = 0},
	map_pos_y =  {id = "y",type=TYPE_INT, default_value = 0},
	map_width =  {id = "width",type=TYPE_INT, default_value = 0},
	map_height =  {id = "height",type=TYPE_INT,default_value = 0},
}
const EXTENSIONS = {
	map = ["tmx"]
}
