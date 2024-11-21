extends CanvasLayer

@onready var area = $Area2D  

var time = Global.speedrun_time
var contando = true 

func _ready():
	
	area.connect("body_entered", Callable(self, "_on_area_body_entered"))

func _physics_process(delta):
	if contando:
		time = float(time) + delta
		update_ui()
	
func update_ui():
 
	var formatted_time = str(time)
	var decimal_index = formatted_time.find(".")
	
	if decimal_index > 0:
		formatted_time = formatted_time.left(decimal_index + 3)  
	
	Global.speedrun_time = formatted_time
	$Label.text = formatted_time


func _on_area_body_entered(body):
	if body.is_in_group("oveja"): 
		stop_contador()  


func stop_contador():
	contando = false
	print("Contador detenido.")
