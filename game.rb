#!/usr/bin/env ruby -w

require 'gosu'
require './lib/player'

class GameWindow < Gosu::Window
  
  def initialize
    super(640, 480, false)
    @background_image = Gosu::Image.new(self, "assets/background.png", true)
    @player = Player.new(self)

  end

	# 60 times per second by default
	def update
	  
	  if button_down? Gosu::KbQ
      close
    end

	end

	# This happens immediately after each iteration of the update method
	def draw
		@background_image.draw(0, 0, 0)
		@player.draw
		
	end

end	

window = GameWindow.new
window.show