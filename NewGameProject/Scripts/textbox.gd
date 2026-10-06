extends Control

var is_textbox_up = false
var is_dialogue_done = false
var i = 0
var dialogue_printed = false

@onready var animationplayer = $AnimationPlayer
@onready var text_dialogue = $Panel/text_dialogue

func show_textbox():
	animationplayer.play("textbox_slidein")
	await animationplayer.animation_finished
	is_textbox_up = true
	text_dialogue.visible = true
	text_dialogue.visible_ratio = 0

func hide_textbox():
	text_dialogue.visible = false
	animationplayer.play("textbox_slideout")
	await animationplayer.animation_finished
	is_textbox_up = false
	queue_free()

func next_text():
	if Input.is_action_just_released("left_click"):
		i += 1
		dialogue_printed = false
		text_dialogue.visible_ratio = 0

func add_text(param):
	if i < param.size():
		while i != param.size() and dialogue_printed == false:
			text_dialogue.text = param[i]
			dialogue_printed = true
	elif i == param.size() and is_textbox_up == true:
		hide_textbox()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_textbox()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	next_text()
	add_text(Globals.current_dialogue)
	if text_dialogue.visible_ratio < 1:
		text_dialogue.visible_characters += 1
	else:
		pass
