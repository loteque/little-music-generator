extends VBoxContainer

export (NodePath) var lanes_node
export (NodePath) var boards_node
export (NodePath) var is_auto_pulse_all_node
export (NodePath) var add_lane_button_node

onready var lanes: Node = get_node(lanes_node)
onready var boards: Node = get_node(boards_node)
onready var is_auto_pulse_all: Node = get_node(is_auto_pulse_all_node)
onready var add_lane_button: Node = get_node(add_lane_button_node)
onready var boards_array: Array = boards.get_children()
onready var main_timer: Node = get_node("/root/Main/MainTimer")
onready var ui: Node = get_node("/root/Main/UI")

onready var board_scene: Resource = preload("res://src/Board.tscn")
#moved to UI.gd
#signal pulse_all_pressed
signal lane_score_updated(lane_score)
# moved to IsAutoPulseAll.gd
# var auto_pulse_all_cost = 2000000

func _ready():
	connect_board_signals()
# moved to pulseAll.gd
# func emit_pulse_pressed_signal():
#	emit_signal("pulse_all_pressed")
# moved to Utils.gd
#func connect_signal(signal_name: String, target: Node):
#	var connect_signal_err
#	var callback = "_on" + signal_name
#	if is_connected(signal_name, target, callback):
#		connect_signal_err = "pulse_all_pressed is aready connected to " + str(target)
#	else:
#		connect_signal_err = connect("pulse_all_pressed", target, "_on_pulse_all_pressed")
#		if !connect_signal_err:
#			connect_signal_err = "connection successful to " + str(target)
#	return connect_signal_err

func connect_board_signals():
	for board in boards_array:
		var connect_board_signals_err
		# moved to board.gd
		#connect_board_signals_err = Utils.connect_signal($".", "pulse_all_pressed", board)
		#print(connect_board_signals_err)
		
		connect_board_signals_err = Utils.connect_signal($".", "lane_score_updated", board)
		print(connect_board_signals_err)

func add_board():
	var track_cost: int = add_lane_button.cost
	var board_instance = board_scene.instance()
	boards.add_child(board_instance)
	ui.emit_signal("track_added", track_cost)

func _on_AddLane_pressed():
	add_board()
	boards_array = boards.get_children()
	connect_board_signals()
# moved to PulseAll.gd
#func _on_PulseAll_pressed():
#	emit_pulse_pressed_signal()
# moved to PulseAll.gd 
#func _on_MainTimer_timeout():
#	if is_auto_pulse_all.pressed:
#		emit_pulse_pressed_signal()
# moved to IsAutoPulseAll.gd
# func _on_IsAutoPulseAll_toggled(button_pressed:bool):
#	if button_pressed:
#		ui.emit_signal("auto_pulse_all_added", auto_pulse_all_cost)