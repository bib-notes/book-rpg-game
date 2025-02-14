extends Node
enum GameState{
	PLAY,
	PAUSE,
	MENU,
	
}
var maps: Array
var current_map: String
var current_state:GameState
signal state_change(state:GameState)
