extends MenuButton

var selection: String
var samples: Array

func _ready():
	connect_menu_item_signals()

func connect_menu_item_signals():
	var id_pressed_error = get_popup().connect("id_pressed", self, "_on_id_pressed")
	if id_pressed_error:
		print(id_pressed_error)

func _on_id_pressed(id):
	selection = get_popup().get_item_text(id)
	text = selection


func _on_Beat_about_to_show():
	connect_menu_item_signals()
