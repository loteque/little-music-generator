extends Button

export (NodePath) var ui_node = "/root/Main/UI"
export (NodePath) var main_timer_node = "/root/Main/MainTimer"

onready var ui: Node = get_node(ui_node)
onready var main_timer = get_node(main_timer_node)

func emit_pulse_all_pressed_signal():
	ui.emit_signal("pulse_all_pressed")

func _on_MainTimer_timeout():
	if pressed:
		emit_pulse_all_pressed_signal()

func _ready():
	var err = Utils.connect_signal(main_timer, "timeout", self)
	print(err)