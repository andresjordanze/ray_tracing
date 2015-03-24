class Color
  attr_accessor :r, :g, :b

  def initialize(r,g,b)
    @r = r
    @g = g
    @b = b
  end

  def sum(c2)
    r = (@r + c2.r)
    g = (@g + c2.g)
    b = (@b + c2.b)
    res = Color.new(r,g,b)
  end

  def res(c2)
    r = (@r - c2.r)
    g = (@g - c2.g)
    b = (@b - c2.b)
    res = Color.new(r,g,b)
  end

  def esc(c2)
    res = (@r * c2.r)+(@g * c2.g)+(@b * c2.b)
  end

  def vec(c2)
    r = (@g * c2.b)-(c2.g * @b)
    g = (@b * c2.r)-(c2.b * @r)
    b = (@r * c2.g)-(c2.r * @g)
    res = Color.new(r,g,b)
  end

  def mod
    res = Math.sqrt((@r**2)+(@g**2)+(@b**2))
  end

  def prod(n)
    r = @r*n
    g = @g*n
    b = @b*n
    res = Color.new(r,g,b)
  end

  def div(n)
    num = n.to_f
    r = @r * (1 / num)
    g = @g * (1 / num)
    b = @b * (1 / num)
    res = Color.new(r,g,b)
  end

  def prod_col(r,g,b)
    v_r = @r*r
    v_g = @g*g
    v_b = @b*b
    Color.new(v_r,v_g,v_b)
  end
end