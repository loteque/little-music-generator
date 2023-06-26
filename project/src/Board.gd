extends VBoxContainer

export (NodePath) var count_node
export (NodePath) var pulse_button_node

onready var count: Node =  get_node(count_node)
onready var pulse_button: Node = get_node(pulse_button_node)
onready var audio: Node = get_node("/root/Main/Audio")
onready var lane_manager: Node = get_node("/root/Main/UI/LaneManager")

var beat_scene = preload("res://src/Beat.tscn")
var number_of_beats: int = 4
var c
var a
var b

var count_menu_index: int = 0

func _ready():
	c = count.get_children()
	a = audio.get_children()
	b = get_children()
	populate_beats(beat_scene, count, number_of_beats)

func get_beat_audio(beat_index):
	c = count.get_children()
	var sample_name = c[beat_index].selection
	return audio.get_node(sample_name).get_child(0)

func update_index_by_1(i):
	return i + 1

func reset_index():
	return 0

func populate_beats(beat_menu, beat_count, num_beats):
	var instance_tooltip = "richt click to select sample"
	for i in num_beats:
		if !beat_count.get_child(i):
			var instance_name = "Beat" + str(i + 1)
			var beat_instance = beat_menu.instance()
			beat_instance.name = instance_name
			beat_instance.text = instance_name
			beat_instance.set_tooltip(instance_tooltip)
			beat_instance.connect("about_to_show", self, "_on_Beat_about_to_show")
			beat_count.add_child(beat_instance)

func populate_samples(beat_menus, audio_samples):	
	for beat in beat_menus:
		beat.get_popup().clear()
		for sample in audio_samples:
			if sample.is_enabled():
				beat.get_popup().add_item(sample.name)

func _on_Beat_about_to_show():
	var samples = audio.get_children()
	var beats = count.get_children()
	populate_samples(beats, samples)

func _on_Pulse_pressed():
	c = count.get_children()
	if count_menu_index == c.size():
		count_menu_index = reset_index()
	get_beat_audio(count_menu_index).play()
	count_menu_index = update_index_by_1(count_menu_index)

func _on_pulse_all_pressed():
	pulse_button.emit_signal("pressed")

func _on_AddBeat_pressed():
	number_of_beats += 1
	populate_beats(beat_scene, count, number_of_beats)
