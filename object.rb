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
    maxi = [0, nxl].max
    kd = @diff_color
    i = light.prod(maxi)
    l = i.prod_col(kd.r,kd.g,kd.b)
  end

  def blinn_phong_shading(light, h, l)
    lamb_shad = lambertian_shading(light, l)
    nxh = @normal.esc(l)
    maxi = [0, nxh].max
    maxP = maxi**@specular_coef
    i = light.prod(maxP)
    ks = @specular_color.prod_col(i.r,i.g,i.b)
    res = lamb_shad.sum(ks)
  end

  def normal(p)
  end

end