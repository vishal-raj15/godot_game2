extends CanvasLayer

signal start_game

func show_message(text):
	$messageLabel.text = text
	$messageLabel.show()
	$messageTimer.start()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func game_over():
	show_message("Game Over")
	yield($messageTimer , "timeout")
	$startButton.show()
	$messageLabel.text = "Dodge the\nCreeps!"
	$messageLabel.show()
#	yield(get_tree().create_timer(1), "timeout")
	
	
func update_score(score):
	$scoreLabel.text = str(score)

func _on_messageTimer_timeout():
	$messageLabel.hide()
	

func _on_startButton_pressed():
	$startButton.hide()
	emit_signal("start_game")
