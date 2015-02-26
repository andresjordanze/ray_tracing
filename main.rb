require_relative 'ray_tracer'

renderer = RayTracer.new(640, 480)
renderer.render('Raytracing', 'raytracing.png')