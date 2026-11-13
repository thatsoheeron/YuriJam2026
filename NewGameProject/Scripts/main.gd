extends Node2D

var characters = null
var textbox = null
var text_int = 0

var one = "one"
var two = "two"
var three = "three"

var left = "left"
var mid = "mid"
var right = "right"

var fem = ""
var butch = ""
var shittyguy = ""

func char_enter(character: String, dir: String, express: String):
	if is_instance_valid(textbox):
		change_expression(character, express)
		Globals.char_enter(characters, character, dir)

func char_exit(character: String, dir: String, express: String):
	if is_instance_valid(textbox):
		change_expression(character, express)
		Globals.char_exit(characters, character, dir)

func char_move(character: String, dir: String, express: String):
	if is_instance_valid(textbox):
		change_expression(character, express)
		Globals.char_move(characters, character, dir)

func change_expression(pos: String, express: String):
	if is_instance_valid(textbox) and Globals.expression_changed == false:
		Globals.change_expression(pos, express)
		Globals.expression_changed = true

func change_dialogue(param):
	if is_instance_valid(textbox):
		Globals.change_current_speaker(param)
		Globals.current_dialogue = param["dialogue"]
		textbox.array_int = 0

func change_dialogue_enter(param, character: String, dir: String, express: String):
	text_int = textbox.i
	if is_instance_valid(textbox):
		change_dialogue(param)
		char_enter(character, dir, express)

func change_dialogue_exit(param, character: String, dir: String, express: String):
	if is_instance_valid(textbox):
		change_expression(character, express)
		change_dialogue(param)
		char_exit(character, dir, express)

func change_dialogue_charchange(param, character: String, dir: String, express: String):
	if is_instance_valid(textbox):
		change_expression(character, express)
		char_move(character, dir, express)
		change_dialogue(param)

func change_dialogue_expression(param, character, express):
	if is_instance_valid(textbox):
		change_expression(character, express)
		change_dialogue(param)

func _ready() -> void:
	characters = Globals.chara.instantiate()
	textbox = Globals.text.instantiate()
	add_child(characters)
	add_child(textbox)
	butch = one
	fem = two
	shittyguy = three

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	char_enter(butch, left, "neutral")
	char_enter(fem, right, "neutral")
	char_enter(shittyguy, right, "neutral")

#	text_int = textbox.i
#	if (text_int == 0):
#		change_dialogue(Dialogue.narration_1)
#	elif (text_int == 5):
#		char_enter(mid, left, "neutral")
#	elif (text_int == 7):
#		char_exit(mid, right, "neutral")
#	elif (text_int == 8):
#		change_dialogue_enter(Dialogue.butch_1, left, left, "neutral")
#	elif (text_int == 9):
#		change_dialogue(Dialogue.narration_2)
#	elif (text_int == 11):
#		change_dialogue(Dialogue.fem_1)
#	elif (text_int == 12):
#		change_dialogue_enter(Dialogue.fem_2, right, right, "FemContent")
#	elif (text_int == 13):
#		change_dialogue(Dialogue.narration_3)
#	elif (text_int == 17):
#		change_dialogue_expression(Dialogue.butch_2, left, "happy")
#	elif (text_int == 18):
#		change_dialogue_charchange(Dialogue.narration_4, right, mid, "FemContent")
#	elif (text_int == 19):
#		Globals.char_move(mid, right, "FemContent")
#	elif (text_int == 20):
#		change_dialogue(Dialogue.fem_2)
#	elif (text_int == 21):
#		change_dialogue_charchange(Dialogue.narration_5, left, mid, "happy")
#	elif (text_int == 22):
#		char_enter(left, left, "neutral")
#	elif (text_int == 27):
#		change_dialogue(Dialogue.shittyguy_1)
