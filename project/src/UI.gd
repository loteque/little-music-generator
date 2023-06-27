extends Control

signal lane_score_pressed(lane_score)

export (NodePath) var score_node

onready var score: Node = get_node(score_node)
#onready var lane_score_pressed_err = connect("lane_score", self, "_on_score_node_pressed")

func _on_UI_lane_score_pressed(lane_score):
	score.text = str(int(score.text) + lane_score)
