#script: ground

extends StaticBody2D

onready var bottom_right = get_node("bottom_right")
onready var camera = utils.get_main_node().get_node("camera")

signal destroyed

func _ready():
	set_process(true)
	# add_to_group(game.GROUP_GROUNDS)
	pass
	
func _process(delta):
	if camera == null: return
	if bottom_right.get_global_position().x <= camera.get_total_pos().x:
		queue_free()
		emit_signal("destroyed")
	pass