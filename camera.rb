class Camera
  attr_accessor :e, :pv, :up, :fov, :df, :dv, :u_vec, :v_vec, :w_vec, :nx, :ny

  def initialize(e, pv, up, fov, df, nx, ny)
    @e = e
    @pv = pv
    @up = up
    @fov = fov * 0.0174532925
    @dv = @pv.res(@e)
    @df = df
    @v_vec = set_v
    @w_vec = set_w
    @u_vec = set_u
    @nx = nx
    @ny = ny
  end

  def set_v
    return @up.div(@up.mod)
  end

  def set_w
    return (@dv.div(@dv.mod)).prod(-1)
  end

  def set_u
    return (@v_vec.vec(@w_vec)).div((@v_vec.vec(@w_vec)).mod)
  end

  def calculate_u(i)
    t = @df * Math.tan(@fov/2)
    r = (@nx*t)/@ny
    l = -r
    return (l+(r-l)*((i+0.5)/@nx))
  end

  def calculate_v(j)
    t = @df * Math.tan(@fov/2)
    b = -t
    return (b+(t-b)*((j+0.5)/@ny))
  end

  def calculate_d(i,j)
    dxw = @w_vec.prod(-@df)
    uxu = @u_vec.prod(calculate_u(i))
    vxv = @v_vec.prod(calculate_v(j))
    res = (dxw.sum(uxu)).sum(vxv)
    return res
  end
end