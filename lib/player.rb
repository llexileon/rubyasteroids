class Player
  def initialize(window)
  	@image = Gosu::Image.new(window, 'assets/ship.png', false)
  	@velocity_x = @velocity_y = @angle = 0.0
  	@x, @y = 320, 240
  end

  def draw
    @image.draw_rot(@x, @y, 0, @angle)
  end

  def accelerate
    @velocity_x += Gosu::offset_x(@angle, 0.10)
    @velocity_y += Gosu::offset_y(@angle, 0.10)
  end

  def move
    @x += @velocity_x
    @y += @velocity_y

    @x %= 640
    @y %= 480

    @velocity_x *= 1
    @velocity_y *= 1
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

end