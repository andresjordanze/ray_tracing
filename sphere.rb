require_relative 'object'

class Sphere < Object

  attr_accessor :radius, :center

  def initialize(radius, center)
    super(0.0, 0.0, 0.0)
    @radius = radius
    @center = center
  end

  def intersect(e, d)
    d = d.prod(-1)
    dxe_c = d.esc(e.res(@center))
    dxe_c2 = (d.esc(e.res(@center)))**2
    dxd = d.esc(d)
    e_cxe_c_r2 = ((e.res(@center)).esc(e.res(@center)) - (@radius)**2)

    if (dxe_c2-dxd*e_cxe_c_r2) < 0
      t = +1.0/0.0
    else
      t1 = (dxe_c - Math.sqrt(dxe_c2-dxd*e_cxe_c_r2)) / dxd
      t2 = (dxe_c + Math.sqrt(dxe_c2-dxd*e_cxe_c_r2)) / dxd
      if t1<t2
        t = t1
      else
        t = t2
      end
    end
    t



  end

  def set_normal(p)
    x = p.res(center).div(@radius)
    @normal = x.div(x.mod)
  end

end