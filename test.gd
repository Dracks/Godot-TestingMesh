
extends Node

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initalization here
	#base()
	surface()
	geometry()
	#set_process(true)
	
func _process(delta):
	geometry()
	

func geometry():
	var g=get_node('geometry')
	var img=load('res://texture.png')
	g.begin(Mesh.PRIMITIVE_TRIANGLES, img)
	
	#g.set_color(Color(1,0,0,0.5))
	g.set_uv(Vector2(0,0))
	g.add_vertex(Vector3(-1,0,1))
	g.set_uv(Vector2(0,40))
	g.add_vertex(Vector3(-1,0,-1))
	g.set_uv(Vector2(40,40))
	g.add_vertex(Vector3(1,0,-1))
	
	g.end()
	
	
func surface():
	var s=SurfaceTool.new()
	s.begin(Mesh.PRIMITIVE_TRIANGLES)
	s.add_color(Color(1,0,0))
	
	s.add_vertex(Vector3(-1,0,1))
	s.add_vertex(Vector3(-1,0,-1))
	s.add_vertex(Vector3(1,0,-1))
	s.add_vertex(Vector3(1,0,1))
	
	s.generate_normals()
	var surf=get_node('Surface')
	surf.set_mesh(s.commit())

func base():
	var mesh=Mesh.new()
	var listVertex=[[
		Vector3(-1,0, 1),Vector3( 1,0, 1),Vector3(-1,0,-1),
		Vector3(-5,0,-5),Vector3( 5,0, 5),Vector3( 5,0,-5),
		Vector3(-5, 5, 0), Vector3(5, 5, 0), Vector3(-.5, 0, 0),],
	]
	mesh.add_surface(Mesh.PRIMITIVE_TRIANGLES, listVertex, [0,2,1,3,4,5])
	get_node('MeshInstance').set_mesh(mesh);


