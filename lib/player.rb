class Player
  def initialize(window)
  	@image = Gosu::Image.new(window, 'assets/ship.png', false)
  end

  def draw
    @image.draw_rot(320, 240, 0, 0)
  end
end