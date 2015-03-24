require_relative 'renderer'
require_relative 'camera'
require_relative 'color'
require_relative 'light'
require_relative 'vector3d'

class RayTracer < Renderer
  attr_accessor :objects, :camera, :light

  def initialize(width, height, e, pv, up, fov, df)
    super(width, height, 0.0, 0.0, 0.0)
    @objects = Array.new
    @camera = Camera.new(e, pv, up, fov, df, width, height)
    @light = Light.new(Vector3d.new(278.0, 547.0, 279.5),Color.new(0.8, 0.7, 0.6))
  end

  def calculate_pixel(i, j)
    {red: i.to_f / width, green: j.to_f / height, blue: 1.0}
    e = @camera.e
    d = @camera.calculate_d(i,j)
    tmin = +1.0/0.0
    objmin = nil
    @objects.each do |object|
      t = object.intersect(e,d)
      if (t < tmin)
        tmin = t
        objmin = object
      end
    end

    if objmin.nil?
      color = Color.new(i.to_f/width,j.to_f/height,1.0)
    else
      #color = objmin.diff_color
      p = e.sum(d.prod(tmin))
      objmin.set_normal(p)
      l = @light.position.res(p)
      l_unit = l.div(l.mod)
      color = objmin.lambertian_shading(@light.color,l_unit)
    end
    {red: color.r, green: color.g, blue: color.b}
  end

  def add_objects(object)
    @objects << object
  end

end
