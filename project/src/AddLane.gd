extends Button

export (int) var cost
export (NodePath) var boards_node = "../Boards"
onready var main_timer: Node = get_node("/root/Main/MainTimer")
onready var ui: Node = get_node("/root/Main/UI")
onready var score: Node = get_node("/root/Main/UI/ScoreContainer/Score")
onready var boards: Node = get_node(boards_node)
onready var board_scene: Resource = preload("res://src/Board.tscn")

func add_board():
	var track_cost: int = cost
	var board_instance = board_scene.instance()
	boards.add_child(board_instance)
	ui.emit_signal("track_added", track_cost)

func _on_AddLane_pressed():
	add_board()

func _on_AddLane_mouse_entered():
	hint_tooltip = "Add track\n Cost: "	+ str(cost)

func _on_main_timer_timeout():
	if int(score.text) < cost:
		disabled = true
	else:
		disabled = false
		
func _ready():
	main_timer.connect("timeout", self, "_on_main_timer_timeout")
