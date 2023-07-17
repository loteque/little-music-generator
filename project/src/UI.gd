extends Control

signal lane_score_pressed(lane_score)
signal lane_score_updated(lane_score)
signal sample_selected(sample_cost)
signal beat_added(beat_cost)
signal track_added(track_cost)
signal auto_pulse_all_added(auto_pulse_all_cost)
signal auto_pulse_added(auto_pulse_cost)
signal pulse_all_pressed

export (NodePath) var score_node

onready var score: Node = get_node(score_node)

func subtract_from_score(subtrahend: int, current_score: int):
	score.text = str(current_score - subtrahend)
	print(score.text)

func _on_UI_lane_score_pressed(lane_score):
	score.text = str(int(score.text) + lane_score)

func _on_UI_sample_selected(sample_cost):
	print("UI.gd: sample_selected signal recieved")
	subtract_from_score(sample_cost, int(score.text))

func _on_UI_track_added(track_cost):
	print("UI.gd: track_added signal recieved")
	subtract_from_score(track_cost, int(score.text))

func _on_UI_beat_added(beat_cost):
	print("UI.gd: beat_added signal recieved")
	subtract_from_score(beat_cost, int(score.text))

func _on_UI_auto_pulse_added(auto_pulse_cost):
	print("UI.gd: auto_pulse_added signal recieved")
	subtract_from_score(auto_pulse_cost, int(score.text))

func _on_UI_auto_pulse_all_added(auto_pulse_all_cost):
	print("UI.gd: auto_pulse_all_added signal recieved")
	subtract_from_score(auto_pulse_all_cost, int(score.text))


