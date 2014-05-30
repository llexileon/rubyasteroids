include Math

class Asteroid
  def initialize(window)
    @image = Gosu::Image.new(window, 'assets/asteroid-large-1.png', false)
    @x, @y, @angle = rand(640), rand(240), rand(360)
    @speed_modifier = 2
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def move
    @x += @speed_modifier*Math.sin(Math::PI/180*@angle)
    @y += -@speed_modifier*Math.cos(Math::PI/180*@angle)
    @x %= 640
    @y %= 480
  end
end