extends Node3D


@export var fire_rate: float = 14.0
@export var recoil: float = .05
@export var weapon_mesh: Node3D

@onready var cooldown_timer: Timer = $CooldownTimer
@onready var ray_cast_3d: RayCast3D = $RayCast3D
@onready var weapon_start_position: Vector3 = weapon_mesh.position


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_pressed("Fire"):
		if cooldown_timer.is_stopped():
			shoot()
	weapon_mesh.position = weapon_mesh.position.lerp(weapon_start_position, delta * 10.0)


func shoot() -> void:
	cooldown_timer.start(1.0 / fire_rate)
	weapon_mesh.position.z += recoil
	print(ray_cast_3d.get_collider())
