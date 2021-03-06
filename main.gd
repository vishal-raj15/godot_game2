extends Node
export (PackedScene) var mob
var score


func _ready():
	randomize()
	 # Replace with function body.

func new_game():
	score = 0
	$player.start($StartPosition.position)
	$startTimer.start()
	$HUD.show_message("Get Ready")
	$HUD.update_score(score)
	$music.play()
	
func game_over():
	$scoreTimer.stop()
	$mobTimer.stop()
	$HUD.game_over()
	$deathSound.play()
	$music.stop()

func _on_startTimer_timeout():
	$mobTimer.start()
	$scoreTimer.start()

func _on_scoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	

func _on_mobTimer_timeout():
	$mobPath/mobSponLocation.set_offset(randi())
	var mobs = mob.instance()
	add_child(mobs)
	var direction = $mobPath/mobSponLocation.rotation + PI/2
	mobs.position = $mobPath/mobSponLocation.position
	direction += rand_range(-PI/4 , PI/4)
	mobs.rotation = direction
	mobs.set_linear_velocity(Vector2(rand_range(mobs.min_speed , mobs.max_speed) , 0).rotated(direction))


