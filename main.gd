extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var playerData = get_node("/root/PlayerData")
	
	if playerData.get_player_last_pos() != Vector2i(0,0):
		$Player.position = playerData.get_player_last_pos() - Vector2i(15, 0)
