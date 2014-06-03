module AudioEngine

  def audio_engine
    soundtrack
    foleyfx
  end

  def soundtrack # Game Soundtrack
    @soundtrack = [] 
    @soundtrack << Gosu::Song.new("assets/audio/sunriseonmars.mp3")
    @song = @soundtrack.first
    @song.play(looping = true)
  end

  def foleyfx # Game Foley
    @laser_sample = Gosu::Sample.new(self, "assets/audio/laser.mp3")
    @hit_sample = Gosu::Sample.new(self, "assets/audio/hit.mp3")
    @warp_sample = Gosu::Sample.new(self, "assets/audio/warp.mp3")
  end

end
