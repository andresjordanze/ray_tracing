require_relative 'color'
require_relative 'vector3d'

class Light
  attr_accessor :position, :color

  def initialize(position,color)
    @position = position
    @color = color
  end

end