require_relative 'ray_tracer'
require_relative 'vector3d'
require_relative 'color'
require_relative 'sphere'
require_relative 'triangle'

e = Vector3d.new(278.0, 273.0, -800.0)
pv = Vector3d.new(278.0, 273.0, -700)
up = Vector3d.new(0.0, 1.0, 0.0)
#up = Vector3d.new(0.0, -1.0, 0.0)
fov = 39.31
df = 0.035

renderer = RayTracer.new(640, 480, e, pv, up, fov, df)

#sphere1 = Sphere.new(120, Vector3d.new(370.0, 120.0, 370.0))
sphere1 = Sphere.new(120, Vector3d.new(370.0, 220.0, 370.0))
sphere1.diff_color = Color.new(0.156, 0.126, 0.506)
sphere1.specular_color = Color.new(1.0, 1.0, 1.0)
sphere1.specular_coef = 100.0

sphere2 = Sphere.new(120, Vector3d.new(130.0, 100.0, 130.0))
sphere2.diff_color = Color.new(0.656, 0.626, 0.107)
#sphere2.specular_color = Color.new(0.0, 0.0, 0.0)
#sphere2.specular_coef = 1.0
sphere2.specular_color = Color.new(1.0, 1.0, 1.0)
sphere2.specular_coef = 1000.0
sphere2.mirror_coef = Vector3d.new(0.4, 0.4, 0.4)

a1 = Vector3d.new(552.8, 0.0, 0.0)
b1 = Vector3d.new(0.0, 0.0, 0.0)
c1 = Vector3d.new(0.0, 0.0, 559.2)

triangle1 = Triangle.new(a1,b1,c1)
triangle1.diff_color = Color.new(0.0, 0.4, 0.0)
triangle1.specular_color = Color.new(0.0, 0.0, 0.0)
triangle1.specular_coef = 1.0
triangle1.mirror_coef = nil

a2 = Vector3d.new(552.8, 0.0, 0.0)
b2 = Vector3d.new(0.0, 0.0, 559.2)
c2 = Vector3d.new(549.6, 0.0, 552.8)


triangle2 = Triangle.new(a2,b2,c2)
triangle2.diff_color = Color.new(0.0, 0.4, 0.0)
triangle2.specular_color = Color.new(0.0, 0.0, 0.0)
triangle2.specular_coef = 1.0
triangle2.mirror_coef = Vector3d.new(0.5, 0.5, 0.5)

renderer.add_objects(sphere1)
renderer.add_objects(sphere2)
renderer.add_objects(triangle1)
renderer.add_objects(triangle2)
renderer.render('Raytracing', 'raytracing.png')