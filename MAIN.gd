extends Node3D
@onready var Player = $CharacterBody3D
@onready var Zombie = $CharacterBody3D2
@onready var Button1 = $NavigationRegion3D/StaticBody3D37
@onready var Button2 = $NavigationRegion3D/StaticBody3D38
@onready var Button3 = $NavigationRegion3D/StaticBody3D39
@onready var Door = $NavigationRegion3D/StaticBody3D40
@onready var MessageThing = $RichTextLabel
var Zombies = preload("res://Zombies.tscn")
var ZombiesSCRIPT = preload("res://Zombies.gd")
var differenceBetween
var button1Pressed = false
var button2Pressed = false
var button3Pressed = false
var SpaceBarPress = false
var yes = true
var doorOpened = false
var newZombie
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
	if abs(abs(Playerx) - abs(Zombiex)) <= 1.5 and abs(abs(PlayerZ) - abs(ZombieZ)) <= 1.5:
		MessageThing.set_text("YOU DIED TRY AGAIN")
		Player.set_position(Vector3(7.582,0.5,3.679))
		
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
	if button1Pressed == true and button2Pressed == true and button3Pressed == true:
		if doorOpened == false:
			Door.queue_free()
			doorOpened = true
		MessageThing.set_text("A DOOR HAS OPENED IN THE MAZE!!!! GO THROUG DOOR TO ESCAPE THE MONSTERS")
	else:
		if abs(abs(Playerx) -  abs(40)) <= 2 and abs(abs(PlayerZ) - abs(-174)) <= 2:
			MessageThing.set_text("Press Spacebar to hit the button")
			if SpaceBarPress == true:
				MessageThing.set_text("You hit Button number 1")
				button1Pressed = true
		elif abs(abs(Playerx) - abs(-2.56)) <= 2 and abs(abs(PlayerZ) - abs(95)) <= 2:
			MessageThing.set_text("Press Spacebar to hit the button")
			if SpaceBarPress == true:
				MessageThing.set_text("You hit Button number 2")
				button2Pressed = true
		elif abs(abs(Playerx) - abs(420)) <= 2 and abs(abs(PlayerZ) - abs(171.5)) <= 2:
			MessageThing.set_text("Press Spacebar to hit the button")
			if SpaceBarPress == true:
				MessageThing.set_text("You hit Button number 3")
				button3Pressed = true
		else:
			MessageThing.set_text(" ")
func ButtonPress():
	if Input.is_action_just_pressed("SPACEBAR"):
		SpaceBarPress = true
	if Input.is_action_just_released("SPACEBAR"):
		SpaceBarPress = false
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
func SPAWNTHEM():
	yes = false
	await get_tree().create_timer(10).timeout
	newZombie = Zombies.instantiate()
	newZombie.set_script(ZombiesSCRIPT)
	newZombie.set_position(Vector3(0,2.756,2.565))
	add_child(newZombie)
	yes = true
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	didDie()
	ButtonPress()
	ButtonClose()
	if yes == true:
		SPAWNTHEM()
	print(Player.position)
	print(Zombie.position)


