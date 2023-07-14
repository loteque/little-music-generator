extends Node

func connect_signal(signal_node: Node, signal_name: String, target: Node):

	var connect_signal_err
	var callback = "_on_" + signal_node.name + "_" + signal_name
	if is_connected(signal_name, target, callback):
		connect_signal_err = signal_name + " is aready connected to " + str(target)
	else:
		connect_signal_err = signal_node.connect(signal_name, target, callback)
		if !connect_signal_err:
			var connect_signal_success = "Utils.gd, connect_signal: connection successful to " + str(target) + " from " + signal_name + " at " + str(signal_node)
			return connect_signal_success
	return "Utils.gd, connect_signal: Err " + str(connect_signal_err) + ":" + " connecting " + signal_name + " at " + str(signal_node) + " to " + str(target)
