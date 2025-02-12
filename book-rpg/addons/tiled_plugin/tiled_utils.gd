@tool
class_name TiledUtils

static func cleanup_path(path: String) -> String:
	while true:
		var path_arr = path.split("/")
		var is_clean: bool = true
		for i in range(1, path_arr.size()):
			if path_arr[i] == "..":
				path_arr[i] = ""
				path_arr[i-1] = ""
				is_clean = false
				break
			if path_arr[i] == ".":
				path_arr[i] = ""
				is_clean = false
		var new_path = ""
		for t in path_arr:
			if t == "": continue
			if new_path != "":
				new_path += "/"
			if t != "":
				new_path += t
		if is_clean:
			return new_path
		path = new_path
	return ""
