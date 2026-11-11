extends Control

var is_textbox_up = false
var is_dialogue_done = false
var i = 0
var array_int = 0
var dialogue_printed = false
var timer_done = false

var nameplate_moved = false
var nameplate_round = false

var nameplate_current = ""
var nameplate_start = ""

@onready var animationplayer = $textbox
@onready var nameplate_anim = $nameplate
@onready var text_dialogue = $Panel/text_dialogue
@onready var timer = $Timer
@onready var name_text = $Panel/nameplate/name

func show_textbox():
	animationplayer.play("textbox_slidein")
	await animationplayer.animation_finished
	is_textbox_up = true
	text_dialogue.visible = true
	text_dialogue.visible_ratio = 0
	timer.start()

func hide_textbox():
	text_dialogue.visible = false
	animationplayer.play("textbox_slideout")
	await animationplayer.animation_finished
	is_textbox_up = false
	queue_free()

func next_text():
	if Input.is_action_just_released("left_click") and timer_done == true:
		i += 1
		array_int += 1
		print(i)
		nameplate_round = false
		dialogue_printed = false
		Globals.leftchar_moved = false
		Globals.midchar_moved = false
		Globals.rightchar_moved = false
		Globals.expression_changed = false
		text_dialogue.visible_ratio = 0
		timer_done = false
		timer.start()

func add_text(param):
	if array_int < param.size():
		while array_int != param.size() and dialogue_printed == false:
			text_dialogue.text = param[array_int]
			dialogue_printed = true

func move_nameplate(param: String, param2: String):
	if Globals.nameplate_moved == false:
		Globals.current_speakers = ""
		text_dialogue.visible = false
		nameplate_anim.play("Nameplate/" + nameplate_current + "nameplate_slide" + param)
		await nameplate_anim.animation_finished
		Globals.current_speakers = param2
		nameplate_current = param
		Globals.nameplate_moved = true

func show_text():
	if text_dialogue.visible_ratio < 1:
		text_dialogue.visible_characters += 1
	else:
		pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_textbox()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	next_text()
	add_text(Globals.current_dialogue)
	show_text()
	name_text.text = Globals.current_speaker

func _on_timer_timeout() -> void:
	timer.stop()
	timer_done = true


func _on_nameplate_animation_finished(_anim_name: StringName) -> void:
	nameplate_moved = true
	text_dialogue.visible_characters = 0
	text_dialogue.visible_ratio = 0
	text_dialogue.visible = true
