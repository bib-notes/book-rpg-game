## World Manager Script
extends Node
## purpose is to load maps
var world_node:TiledWorld = null
var _world:WorldResource
signal world_loaded(world: TiledWorld)
func set_world(node:TiledWorld):
	self.world_node = node
	if node.world != null:
		_world = node.world
func spawn_entity(id:String,pos:Vector2,data=null):
	
	pass
func load_map(map_name):
	
	pass
func load_world(node:TiledWorld):
	if node != null:
		## load
		world_node = node
		if node.world!= null:
			## TODO: LOAD MAPS
			var maps = node.world.maps
			if len(maps)>0:
				for map:Dictionary in maps:
					var fp = map.get("filePath")
					var size = Vector2(map.get("width"),map.get("height"))
					var pos = Vector2(map.get("x"),map.get("y"))
					var scene:PackedScene = load(fp)
					var i:Node2D = scene.instantiate()
					node.add_child(i)
					i.position = pos
				pass
			pass
			world_loaded.emit(node)
	else:
		printerr("Missing World Node")
	pass

func load_map(map_id:String)->void:
	pass
