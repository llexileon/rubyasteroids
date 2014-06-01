#!/usr/bin/env ruby -w

require 'gosu'
require './lib/player'
require './lib/asteroid'
require './lib/projectile'



class GameWindow < Gosu::Window
  
  def initialize
    super(640, 480, false)
    @level = 1
    @initial_asteroid_count = 3
    @background_image = Gosu::Image.new(self, "assets/background.png", true)
    @player = Player.new(self)
    @asteroids = Asteroid.spawn(self, @initial_asteroid_count)
    @projectiles = []
    @life_image = Gosu::Image.new(self, "assets/ship-life.png", false)
		@font = Gosu::Font.new(self, "assets/victor-pixel.ttf", 34)
  end

	# Game loop running 60 times per second by default
	def update
		control_player unless @player.dead?
		@player.move
		@asteroids.each {|asteroid| asteroid.move}
		@asteroids.reject!{|asteroid| asteroid.dead?}
		@projectiles.each {|projectile| projectile.move}
		@projectiles.reject!{|projectile| projectile.dead?}
		detect_collisions
		next_level if @asteroids.size == 0 
	end

	def next_level
		@initial_asteroid_count += 1
		@level += 1
		@asteroids = Asteroid.spawn(self, @initial_asteroid_count) 
	end

	# This happens immediately after each iteration of the update method / game loop
	def draw
		@background_image.draw(0, 0, 0)
		@player.draw unless @player.dead?
		@asteroids.each {|asteroid| asteroid.draw}
		@projectiles.each {|projectile| projectile.draw}
		@font.draw(@player.score, 20, 10, 50, 1.0, 1.0, Gosu::Color::rgb(48, 162, 242))
		@font.draw(@level, 600, 10, 50, 1.0, 1.0, Gosu::Color::rgb(247, 226, 106))
		draw_lives
	end

  def draw_lives
	  return unless @player.lives > 0
	  x = 20
	  @player.lives.times do 
	    @life_image.draw(x, 440, 50)
	    x += 20
	  end
  end

	def button_down(id)
		close if id == Gosu::KbQ
    if id == Gosu::KbSpace
      @projectiles << Projectile.new(self, @player) unless @player.dead?
    end
  end

	def collision?(object_1, object_2)
    hitbox_1, hitbox_2 = object_1.hitbox, object_2.hitbox
    common_x = hitbox_1[:x] & hitbox_2[:x]
    common_y = hitbox_1[:y] & hitbox_2[:y]
    common_x.size > 0 && common_y.size > 0 
  end

  def detect_collisions
  	@asteroids.each do |asteroid|
      if collision?(asteroid, @player)
      	@player.kill
      end
    end  
    @projectiles.each do |projectile| 
      @asteroids.each do |asteroid|
        if collision?(projectile, asteroid)
          projectile.kill
          @player.score += asteroid.points
          @asteroids += asteroid.kill
        end
      end
    end
  end

	def control_player

    if button_down? Gosu::KbUp
      @player.accelerate
    end

	  if button_down? Gosu::KbLeft
	    @player.turn_left
	  end

	  if button_down? Gosu::KbRight
	    @player.turn_right
    end
  end  
end	

window = GameWindow.new
window.show