extends MenuButton

onready var audio: Node = get_node("/root/Main/Audio")

var selection: String
var cost: int
var value: int
var samples: Array

func _ready():
	connect_menu_item_signals()

func connect_menu_item_signals():
	if get_popup().is_connected("id_pressed", self, "_on_id_pressed"):
		return
	
	var id_pressed_error = get_popup().connect("id_pressed", self, "_on_id_pressed")
	if id_pressed_error:
		print(id_pressed_error)

func _on_id_pressed(id):
	var beat_data = get_child(0)	
	var sample_data = audio.get_child(id)
	selection = get_popup().get_item_text(id)
	text = selection
	beat_data.sample_name = sample_data.sample_name
	beat_data.description = sample_data.description
	beat_data.sample_cost = sample_data.sample_cost
	beat_data.sample_value = sample_data.sample_value
	beat_data.sfxr_node = sample_data.sfxr_node
	beat_data.enabled = sample_data.enabled

func _on_Beat_about_to_show():
	connect_menu_item_signals()
