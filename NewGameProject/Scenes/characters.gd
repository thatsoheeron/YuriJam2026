extends Node2D

@onready var leftchar_anim = $left_char_anim
@onready var midchar_anim = $mid_char_anim
@onready var rightchar_anim = $right_char_anim
@onready var left_sprite = $left_char
@onready var mid_sprite = $mid_char
@onready var right_sprite = $right_char

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

func char_pos_check(dir):
	if dir == "left":
		return leftchar_anim
	elif dir == "mid":
		return midchar_anim
	elif dir == "right":
		return rightchar_anim

func one_char_enter(pos: String, dir: String):
	var char_position = char_pos_check(pos)
	char_position.play(pos + "_char_slideon" + dir)
	await char_position.animation_finished

func one_char_exit(pos, dir):
	var char_position = char_pos_check(pos)
	char_position.play(pos + "_char_slideoff" + dir)
	await char_position.animation_finished

func char_move(pos, dir):
	var char_position = char_pos_check(pos)
	char_position.play(pos + "_char_move" + dir)
	await char_position.animation_finished
	if pos == "left":
		left_sprite.modulate.a = invisible
		Globals.leftchar_onscreen = false
	elif pos == "mid":
		mid_sprite.modulate.a = invisible
		Globals.midchar_onscreen = false
	elif pos == "right":
		right_sprite.modulate.a = invisible
		Globals.rightchar_onscreen = false
	
	if dir == "left":
		left_sprite.modulate.a = fully_visible
		left_sprite.position = leftpos
		Globals.leftchar_onscreen = true
	elif dir == "mid":
		mid_sprite.modulate.a = fully_visible
		mid_sprite.position = midpos
		Globals.midchar_onscreen = true
	elif dir == "right":
		right_sprite.modulate.a = fully_visible
		right_sprite.position = rightpos
		Globals.rightchar_onscreen = true

func char_anim_change(param, express):
	if param == "left":
		left_sprite.animation = express
	elif param == "mid":
		mid_sprite.animation = express
	elif param == "right":
		right_sprite.animation = express
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	char_anim_change("left", Globals.leftchar_expression)
	char_anim_change("mid", Globals.midchar_expression)
	char_anim_change("right", Globals.rightchar_expression)

func _on_left_char_animation_changed() -> void:
	left_sprite.play(Globals.leftchar_expression)
	expression_changed = true

func _on_mid_char_animation_changed() -> void:
	mid_sprite.play(Globals.midchar_expression)
	expression_changed = true

func _on_right_char_animation_changed() -> void:
	right_sprite.play(Globals.rightchar_expression)
	expression_changed = true
