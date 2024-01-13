extends Node3D

var postMaterial = load("res://post.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	await  get_tree().process_frame
	await  get_tree().process_frame
	var buffer :RenderSceneBuffersRD =get_viewport().get_render_buffer()
	var rid = buffer.get_texture("render_buffers","custom_0")
	var texture:Texture2DRD= Texture2DRD.new()
	texture.texture_rd_rid=rid
	$CanvasLayer/Custom_0.texture=texture


	buffer.set_meta("post_process_material", postMaterial.get_rid())
	rid = buffer.get_texture("render_buffers","custom_color")
	texture = Texture2DRD.new()
	texture.texture_rd_rid=rid
	$CanvasLayer/Custom_1.texture=texture
	print(rid)

	rid = buffer.get_texture("render_buffers","position")
	texture = Texture2DRD.new()
	texture.texture_rd_rid=rid
	$CanvasLayer/Custom_2.texture=texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
