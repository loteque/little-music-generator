extends VBoxContainer

export (NodePath) var lanes_node
export (NodePath) var boards_node

onready var lanes: Node = get_node(lanes_node)
onready var boards: Node = get_node(boards_node)
onready var boards_array: Array = boards.get_children()
onready var ui: Node = get_node("/root/Main/UI")

onready var board_scene: Resource = preload("res://src/Board.tscn")

signal pulse_all_pressed
signal lane_score_updated(lane_score)

var track_cost: int = 500000
var auto_pulse_all_cost = 2000000

func _ready():
	connect_board_signals()

func emit_pulse_pressed_signal():
	emit_signal("pulse_all_pressed")

func _on_PulseAll_pressed():
	emit_pulse_pressed_signal()

func connect_signal(signal_name: String, target: Node):
	var connect_signal_err
	var callback = "_on" + signal_name
	if is_connected(signal_name, target, callback):
		connect_signal_err = "pulse_all_pressed is aready connected to " + str(target)
	else:
		connect_signal_err = connect("pulse_all_pressed", target, "_on_pulse_all_pressed")
		if !connect_signal_err:
			connect_signal_err = "connection successful to " + str(target)
	return connect_signal_err

func connect_board_signals():
	for board in boards_array:
		var connect_board_signals_err
		
		connect_board_signals_err = connect_signal("pulse_all_pressed", board)
		print(connect_board_signals_err)
		
		connect_board_signals_err = connect_signal("lane_score_updated", board) 
		print(connect_board_signals_err)

func add_board():
	var board_instance = board_scene.instance()
	boards.add_child(board_instance)
	ui.emit_signal("track_added", track_cost)

func _on_AddLane_pressed():
	add_board()
	boards_array = boards.get_children()
	connect_board_signals()

func _on_IsAutoPulseAll_pressed():
	print("is_auto_pressed")
	ui.emit_signal("auto_pulse_all_added", auto_pulse_all_cost)
