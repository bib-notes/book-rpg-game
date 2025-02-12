@tool
## Main compiler for plugin
class_name TiledCompiler extends RefCounted
static func compile_world(raw_text:String,source_file:String):
	var compilation = CompiledWorld.new()
	compilation.compile(raw_text,source_file)
	if len(compilation.errors)>0:
		for err in compilation.errors:
			printerr(err)
		return null
	return compilation
static func compile_map(source_file:String):
	return
