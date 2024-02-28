extends Node3D
@onready var Player = $CharacterBody3D
@onready var Zombie = $CharacterBody3D2
@onready var Button1 = $NavigationRegion3D/StaticBody3D37
@onready var Button2 = $NavigationRegion3D/StaticBody3D38
@onready var Button3 = $NavigationRegion3D/StaticBody3D39
@onready var MessageThing = $RichTextLabel
var differenceBetween
var button1Pressed = false
var button2Pressed = false
var button3Pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func didDie():
	var PlayerPos = Player.position
	var Playerx = PlayerPos[0]
	var PlayerZ = PlayerPos[02]
	var ZombiePos = Zombie.position
	var Zombiex = ZombiePos[0]
	var ZombieZ = ZombiePos[02]
	if abs(abs(Playerx) - abs(Zombiex)) <= 1 and abs(abs(PlayerZ) - abs(ZombieZ)) <= 1:
		pass
func ButtonClose():
	var Button1Pos = Button1.position
	var Button1x = Button1Pos[0]
	var Button1Z = Button1Pos[02]
	var Button2Pos = Button2.position
	var Button2x = Button2Pos[0]
	var Button2Z = Button2Pos[02]
	var Button3Pos = Button3.position
	var Button3x = Button3Pos[0]
	var Button3Z = Button3Pos[02]
	var PlayerPos = Player.position
	var Playerx = PlayerPos[0]
	var PlayerZ = PlayerPos[02]
	if abs(abs(Playerx) - abs(Button1x)) <= 1 and abs(abs(PlayerZ) - abs(Button1Z)) <= 1:
		MessageThing.set_text("Press Spacebar to hit the button")
		if Input.is_action_just_pressed("SPACEBAR"):
			MessageThing.set_text("You hit Button number 1")
			button1Pressed = true
			await(3)
	if abs(abs(Playerx) - abs(Button2x)) <= 1 and abs(abs(PlayerZ) - abs(Button2Z)) <= 1:
		MessageThing.set_text("Press Spacebar to hit the button")
		if Input.is_action_just_pressed("SPACEBAR"):
			MessageThing.set_text("You hit Button number 2")
			button2Pressed = true
			await(3)
	if abs(abs(Playerx) - abs(Button3x)) <= 1 and abs(abs(PlayerZ) - abs(Button3Z)) <= 1:
		MessageThing.set_text("Press Spacebar to hit the button")
		if Input.is_action_just_pressed("SPACEBAR"):
			MessageThing.set_text("You hit Button number 3")
			button3Pressed = true
			await(3)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	didDie()
	ButtonClose()

