extends Node2D

var characters = null
var textbox = null
var text_int = 0

var left = "left"
var mid = "mid"
var right = "right"

func char_enter(pos: String, dir: String):
	if is_instance_valid(textbox):
		Globals.char_enter(characters, pos, dir)

func char_exit(pos: String, dir: String):
	if is_instance_valid(textbox):
		Globals.char_exit(characters, pos, dir)
	else:
		if is_instance_valid(textbox) and textbox.i == text_int:
			Globals.char_exit(characters, pos, dir)

func char_move(pos: String, dir: String):
	if is_instance_valid(textbox):
		Globals.char_move(characters, pos, dir)

func change_expression(pos: String, express: String):
	if is_instance_valid(textbox) and Globals.expression_changed == false:
		Globals.change_expression(pos, express)
		Globals.expression_changed = true

func change_dialogue(param):
	if is_instance_valid(textbox):
		Globals.change_current_speaker(param)
		Globals.current_dialogue = param["dialogue"]
		textbox.array_int = 0

func change_dialogue_enter(param, pos: String, dir: String, express: String):
	text_int = textbox.i
	if is_instance_valid(textbox):
		change_expression(pos, express)
		change_dialogue(param)
		char_enter(pos, dir)

func change_dialogue_exit(param, pos: String, dir: String, express: String):
	if is_instance_valid(textbox):
		change_expression(pos, express)
		change_dialogue(param)
		char_exit(pos, dir)

func change_dialogue_charchange(param, pos: String, dir: String, express: String):
	if is_instance_valid(textbox):
		change_expression(pos, express)
		char_enter(pos, dir)
		change_dialogue(param)

func _ready() -> void:
	characters = Globals.chara.instantiate()
	textbox = Globals.text.instantiate()
	change_expression(left, "neutral")
	change_expression(mid, "neutral")
	change_expression(right, "neutral")
	add_child(characters)
	add_child(textbox)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text_int = textbox.i
	if (text_int == 0):
		change_dialogue(Dialogue.narration_1)
	elif (text_int == 5):
		change_dialogue_enter(Dialogue.narration_2, mid, left, "neutral")
	elif (text_int == 6):
		change_dialogue_exit(Dialogue.narration_3, mid, right, "neutral")
	elif (text_int == 7):
		change_dialogue(Dialogue.narration_4)
	elif (text_int == 8):
		change_dialogue_enter(Dialogue.butch_1, left, left, "neutral")
	elif (text_int == 9):
		change_dialogue(Dialogue.narration_5)
	elif (text_int == 10):
		change_dialogue(Dialogue.fem_1)
	elif (text_int == 11):
		change_dialogue_enter(Dialogue.fem_2, right, right, "FemContent")
	elif (text_int == 16):
		pass
	elif (text_int == 17):
		pass
	elif (text_int == 18):
		pass
	elif (text_int == 19):
		pass
	elif (text_int == 21):
		pass
