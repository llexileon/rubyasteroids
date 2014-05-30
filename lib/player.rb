class Player
  def initialize(window)
  	@image = Gosu::Image.new(window, 'assets/ship.png', false)
  	@angle = 0.0
  end

  def draw
    @image.draw_rot(320, 240, 0, @angle)
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

end