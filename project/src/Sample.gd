extends Node

export (String) var sample_name
export (String) var description
export (int) var sample_cost
export (int) var sample_value
export (NodePath) var sfxr_node
export var enabled: bool = false

onready var player: Node = get_node(sfxr_node)

func is_enabled():
    return enabled