extends Node

onready var rocketIdle : Sprite = $RockteShipIdle
onready var rocketLaunch : Sprite = $RockteShipLaunch
onready var launchButton : TextureButton = $LaunchButton
onready var resetButton : TextureButton = $ResetButton

func _ready() -> void:
	rocketLaunch.visible = false
	resetButton.hide()

func _on_LaunchButton_pressed():
	launchButton.hide()
	rocketIdle.visible = false
	rocketLaunch.visible = true
	$AnimationPlayer.play("Launch")
	if rocketLaunch.position.y == -110:
		yield(get_tree().create_timer(2), "timeout")
		resetButton.show()

func _on_ResetButton_pressed():
	resetButton.hide()
	rocketIdle.visible = true
	rocketLaunch.visible = false
	yield(get_tree().create_timer(1), "timeout")
	launchButton.show()
