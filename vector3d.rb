class Vector3d
  attr_accessor :x, :y, :z

  def initialize(x,y,z)
    @x = x
    @y = y
    @z = z
  end

  def sum(v2)
    x = (@x + v2.x)
    y = (@y + v2.y)
    z = (@z + v2.z)
    r = Vector3d.new(x,y,z)
  end

  def res(v2)
    x = (@x - v2.x)
    y = (@y - v2.y)
    z = (@z - v2.z)
    r = Vector3d.new(x,y,z)
  end

  def esc(v2)
    r = (@x * v2.x)+(@y * v2.y)+(@z * v2.z)
  end

  def vec(v2)
    x = (@y * v2.z)-(v2.y * @z)
    y = (@z * v2.x)-(v2.z * @x)
    z = (@x * v2.y)-(v2.x * @y)
    r = Vector3d.new(x,y,z)
  end

  def mod
    r = Math.sqrt((@x**2)+(@y**2)+(@z**2))
  end

  def prod(n)
    x = @x*n
    y = @y*n
    z = @z*n
    r = Vector3d.new(x,y,z)
  end

  def div(n)
    num = n.to_f
    x = @x * (1 / num)
    y = @y * (1 / num)
    z = @z * (1 / num)
    r = Vector3d.new(x,y,z)
  end
  
end