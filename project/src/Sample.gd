extends Node

export (String) var sample_name
export (String) var description
export (NodePath) var sfxr_node

onready var player: Node = get_node(sfxr_node)

var enabled: bool = false