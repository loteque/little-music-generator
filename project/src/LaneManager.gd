extends VBoxContainer

export (NodePath) var lanes_node
export (NodePath) var boards_node

onready var lanes: Node = get_node(lanes_node)
onready var boards: Node = get_node(boards_node)
onready var boards_array: Array = boards.get_children()

onready var board_scene: Resource = preload("res://src/Board.tscn")

signal pulse_all_pressed

func _ready():
	connect_board_signals()

func emit_pulse_pressed_signal():
	emit_signal("pulse_all_pressed")

func _on_PulseAll_pressed():
	emit_pulse_pressed_signal()

func connect_board_signals():
	for board in boards_array:
		var connect_board_signals_err
		if is_connected("pulse_all_pressed", board, "_on_pulse_all_pressed"):
			print("pulse_all_pressed is aready connected to " + str(board))
		else:
			connect_board_signals_err = connect("pulse_all_pressed", board, "_on_pulse_all_pressed")
			if connect_board_signals_err:
				print(connect_board_signals_err)
			else:
				print("connection successful to " + str(board))

func add_board():
	var board_instance = board_scene.instance()
	boards.add_child(board_instance)

func _on_AddLane_pressed():
	add_board()
	boards_array = boards.get_children()
	connect_board_signals()
