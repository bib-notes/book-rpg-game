@tool
@icon("../../assets/icon.svg")
class_name TiledWorld extends WorldEnvironment
@export var world:WorldResource

func _ready():
	WorldManager.load_world(self)
	pass
## load map from id
func load_map(id:int)->void:
	pass
