require_relative 'renderer'

class RayTracer < Renderer

  def initialize(width, height)
    super(width, height, 0.0, 0.0, 0.0)
  end

  def calculate_pixel(i, j)
    {red: i.to_f / width, green: j.to_f / height, blue: 1.0}
  end
end