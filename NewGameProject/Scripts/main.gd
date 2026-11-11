extends Node2D

var characters = null
var textbox = null

var left = "left"
var mid = "mid"
var right = "right"

func char_enter(text_int: int, pos: String, dir: String):
	if is_instance_valid(textbox) and textbox.i == text_int:
		Globals.char_enter(characters, pos, dir)

func char_exit(text_int: int, pos: String, dir: String):
	if is_instance_valid(textbox) and text_int == 0:
		Globals.char_exit(characters, pos, dir)
	else:
		if is_instance_valid(textbox) and textbox.i == text_int:
			Globals.char_exit(characters, pos, dir)

func char_move(text_int: int, pos: String, dir: String):
	if is_instance_valid(textbox) and textbox.i == text_int:
		Globals.char_move(characters, pos, dir)

func change_expression(text_int: int, pos: String, express: String):
	if is_instance_valid(textbox) and textbox.i == text_int and Globals.expression_changed == false:
		Globals.change_expression(pos, express)
		Globals.expression_changed = true

func change_dialogue(text_int: int, param):
	if is_instance_valid(textbox) and textbox.i == text_int:
		Globals.change_current_speaker(param)
		Globals.current_dialogue = param["dialogue"]
		textbox.array_int = 0

func _ready() -> void:
	characters = Globals.chara.instantiate()
	textbox = Globals.text.instantiate()
	add_child(characters)
	add_child(textbox)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	change_dialogue(0, Dialogue.narration_1)
	change_expression(0, mid, "FemContent")
	char_enter(0, mid, left)
