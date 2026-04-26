extends Sprite2D

@export var normal_spd = 5
var spd = normal_spd

func _process(delta: float) -> void:
	if Input.is_action_pressed("shift"):
		spd = 1
	else:
		spd = normal_spd	
	
	if Input.is_action_pressed("ui_right"):
		position.x += spd
	elif Input.is_action_pressed("ui_left"):
		position.x -= spd	
	elif Input.is_action_pressed("ui_up"):
		position.y -= spd
	elif Input.is_action_pressed("ui_down"):
		position.y += spd
	elif Input.is_action_just_pressed("ctrl"):
		$ProgressBar.value -= 1
		changeLabelText($ProgressBar.value)
	
	if $ProgressBar.value == 0:
		queue_free()	

func _ready() -> void:
	$ProgressBar.value = 5
	changeLabelText($ProgressBar.value)
	
func changeLabelText(data: float) -> void:
	$Label.text = "Health: " + str(roundf(data))
