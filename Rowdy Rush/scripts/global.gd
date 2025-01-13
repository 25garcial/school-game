extends Node

var current_scene = "world"
var transition_scene = false

var player_exit_room_posx = 0
var player_exit_room_posy = 0
var player_start_psx = 0
var player_start_psy = 0

var interaction_text = "[E]" #text displayed when next to interactable object
var gpa: float = 0.20 #xp
