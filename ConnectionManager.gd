extends Node

const PORT = 1234
var ship = null
var players = []

func _ready():
	ship = preload("res://Ship.tscn")
	get_tree().connect("connected_to_server", self, "_connected_ok")

func on_host_game():
	var host = NetworkedMultiplayerENet.new()
	# 4 is the number of maximum clients
	host.create_server(PORT, 4)
	get_tree().set_network_peer(host)
	
	_connected_ok()

func on_join_game(ip):
	var host = NetworkedMultiplayerENet.new()
	host.create_server(ip, PORT)
	get_tree().set_network_peer(host)