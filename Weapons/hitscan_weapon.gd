extends Node3D


@export var fire_rate: float = 14.0

@onready var cooldown_timer: Timer = $CooldownTimer


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_pressed("Fire"):
		if cooldown_timer.is_stopped():
			cooldown_timer.start(1.0 / fire_rate)
			print("Weapon Fired!")
