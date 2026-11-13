extends Node2D

@onready var onechar_anim = $one_char_anim
@onready var twochar_anim = $two_char_anim
@onready var threechar_anim = $three_char_anim
@onready var one_sprite = $one_char
@onready var two_sprite = $two_char
@onready var three_sprite = $three_char

var char_pos_string = ["left", "mid", "right"]
var twochar_pos = ["left", "right", "ends"]
var direction = ["left", "right", ""]
var expression = ["happy", "mad", "sad", "neutral"]

var leftpos = Vector2(250, 270)
var midpos = Vector2(480, 270)
var rightpos = Vector2(710, 270)
var invisible = 0
var fully_visible = 255

var expression_changed = false

func char_check(character: String):
	if character == "one":
		return onechar_anim
	elif character == "two":
		return twochar_anim
	elif character == "three":
		return threechar_anim

func one_char_enter(character: String, dir: String, pos: String):
	var char_position = char_check(character)
	char_position.play(dir + "_slideon_" + pos)
	await char_position.animation_finished

func one_char_exit(character: String, dir: String, pos: String):
	var char_position = char_check(character)
	char_position.play(dir + "_slideon_" + pos)
	await char_position.animation_finished

func char_anim_change(character: String, express):
	if character == "one":
		one_sprite.animation = express
	elif character == "two":
		two_sprite.animation = express
	elif character == "three":
		three_sprite.animation = express
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	char_anim_change("one", Globals.onechar_expression)
	char_anim_change("two", Globals.twochar_expression)
	char_anim_change("three", Globals.threechar_expression)

func _on_one_char_animation_changed() -> void:
	one_sprite.play(Globals.onechar_expression)
	expression_changed = true

func _on_two_char_animation_changed() -> void:
	two_sprite.play(Globals.twochar_expression)
	expression_changed = true

func _on_three_char_animation_changed() -> void:
	three_sprite.play(Globals.threechar_expression)
	expression_changed = true
