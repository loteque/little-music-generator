extends CheckBox

onready var main_timer: Node = get_node("/root/Main/MainTimer")
onready var score: Node = get_node("/root/Main/UI/ScoreContainer/Score")

var cost: int = 2000000

func _ready():
	main_timer.connect("timeout", self, "_on_main_timer_timeout")

func _on_main_timer_timeout():
	if int(score.text) < cost:
		disabled = true
	else:
		disabled = false
