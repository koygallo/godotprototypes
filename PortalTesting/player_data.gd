extends Node

var player_last_position := Vector2i(0, 0)


func set_player_last_pos(position):
	player_last_position = position

func get_player_last_pos():
	return player_last_position
