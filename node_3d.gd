extends Node3D

var deferredMaterial = load("res://deferred.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	for _i in 2:
		await get_tree().process_frame

	var buffer: RenderSceneBuffersRD
	var rid: RID
	var texture: Texture2DRD
	buffer = get_viewport().get_render_buffer()
	buffer.set_meta("deferred_process_material", deferredMaterial.get_rid())

	#法线贴图是-1到1，无法直接渲染
	#rid = buffer.get_texture("render_buffers", "custom_0")
	#texture = Texture2DRD.new()
	#texture.texture_rd_rid = rid
	#$CanvasLayer/Custom_0.texture = texture

	rid = buffer.get_texture("render_buffers", "custom_color")
	texture = Texture2DRD.new()
	texture.texture_rd_rid = rid
	$CanvasLayer/Custom_1.texture = texture

	rid = buffer.get_texture("render_buffers", "defer_position")
	texture = Texture2DRD.new()
	texture.texture_rd_rid = rid
	$CanvasLayer/Custom_2.texture = texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
