extends Node2D

@onready var animation = $AnimationPlayer
@onready var left_char = $left_char
@onready var mid_char = $mid_char
@onready var right_char = $right_char

func one_char_anim(pos: String, character: String, on_or_off: String, direction: String):
	var char_pos = null
	if pos == "left":
		char_pos = left_char
	elif pos == "mid":
		char_pos = mid_char
	elif pos == "right":
		char_pos = right_char
	char_pos.animation = character
	animation.play(pos + "_char_slide" + on_or_off + direction)
	await animation.animation_finished

func two_chars_anim(pos1: String, pos2: String, character1: String, character2: String, on_or_off: String, direction: String):
	var char_pos1 = null
	var char_pos2 = null
	var twin_pos = null
	if pos1 == "left" and pos2 == "right":
		char_pos1 = left_char
		char_pos2 = right_char
		twin_pos = "ends"
	elif pos1 == "left" and pos2 == "mid":
		char_pos1 = left_char
		char_pos2 = mid_char
		twin_pos = "left"
	elif pos1 == "mid" and pos2 == "left":
		char_pos1 = mid_char
		char_pos2 = left_char
		twin_pos = "left"
	elif pos1 == "mid" and pos2 == "right":
		char_pos1 = mid_char
		char_pos2 = right_char
		twin_pos = "right"
	elif pos1 == "right" and pos2 == "mid":
		char_pos1 = right_char
		char_pos2 = mid_char
		twin_pos = "right"
	elif pos1 == "right" and pos2 == "left":
		char_pos1 = right_char
		char_pos2 = left_char
		twin_pos = "ends"
	
	char_pos1.animation = character1
	char_pos2.animation = character2
	
	animation.play("twochar_" + twin_pos + "_slide" + on_or_off + direction) 

func all_chars_anim(character1: String, character2: String, character3: String, on_or_off: String, direction: String):
	left_char.animation = character1
	mid_char.animation = character2
	right_char.animation = character3
	
	animation.play("allchar_slide" + on_or_off + direction)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
