extends VBoxContainer

export (NodePath) var lanes_node

onready var lanes: Node = get_node(lanes_node)
onready var boards: Array = lanes.get_children()

signal pulse_all_pressed

func _ready():
	connect_board_signals()

func emit_pulse_pressed_signal():
	emit_signal("pulse_all_pressed")

func _on_PulseAll_pressed():
	emit_pulse_pressed_signal()

func connect_board_signals():
	for board in boards:
		if is_connected("pulse_all_pressed", board, "_on_pulse_all_pressed"):
			print("pulse_all_pressed is aready connected to " + board)
			return
		var connect_board_signals_err = connect("pulse_all_pressed", board, "_on_pulse_all_pressed")
		if connect_board_signals_err:
			print(connect_board_signals_err)