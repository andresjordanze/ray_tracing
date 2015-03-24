require_relative 'color'
class Object
  attr_accessor :diff_color, :specular_color, :specular_coef, :normal

  def initialize(dc, ds, coef)
    @diff_color = dc
    @specular_color = ds
    @specular_coef = coef
    @normal = Vector3d.new(0.0,0.0,0.0)
  end

  def intersect(e, d)
  end

  def lambertian_shading(light, l)
    nxl = @normal.esc(l)
    puts nxl
    maxi = [0, nxl].max
    kd = @diff_color
    n1 = light.prod(maxi)
    l = n1.prod_col(kd.r,kd.g,kd.b)
  end

  def lambertian_shadiang(lucecilla, l)
    second_member = @normal.dot_product(l)
    variable = [0, second_member].max
    pri = lucecilla.multi(variable, variable, variable)
    sec =pri.multi(@diff_color.red, @diff_color.green, @diff_color.blue)
    color = Colorcito.new(sec.red, sec.green, sec.blue)
  end

  def normal(p)
  end

end