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
    @environment_color = Color.new(0.2, 0.2, 0.2)
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
      #Esferas planas sin sombra ni luz
      #color = objmin.diff_color
      p = e.sum(d.prod(tmin))
      objmin.set_normal(p)
      l = @light.position.res(p)
      l_unit = l.div(l.mod)

      #Esferas con lambertian shading EJERCICIO 1
      #color = objmin.lambertian_shading(@light.color,l_unit)

      #Esferas con lambertian shadign + color ambiental EJERCICIO 2
      #lamb_shad = objmin.lambertian_shading(@light.color, l_unit)
      #diffuse_room = @environment_color.prod_col(objmin.diff_color.r, objmin.diff_color.g, objmin.diff_color.b)
      #color = lamb_shad.sum(diffuse_room)

      #Esferas con blinn phong shading EJERCICIO 3
      e_p = e.res(p)
      v = e_p.div(e_p.mod)
      vplusl = v.sum(l_unit)
      h = vplusl.div(vplusl.mod)

      blin_phon_shad = objmin.blinn_phong_shading(@light.color, h, l_unit)
      diffuse_room = @environment_color.prod_col(objmin.diff_color.r, objmin.diff_color.g, objmin.diff_color.b)
      color = blin_phon_shad.sum(diffuse_room)
    end
    {red: color.r, green: color.g, blue: color.b}
  end

  def add_objects(object)
    @objects << object
  end

end
