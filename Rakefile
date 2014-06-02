require 'rubygems'
require 'bundler/setup' # Releasy requires require that your application uses bundler.
require 'releasy'

#<<<
Releasy::Project.new do
	name "Asteroids"
	version "1.0.0"
	verbose # Can be removed if you don't want to see all build messages.

	executable "game.rb"
	files ["lib/*.rb", "assets/**/*.*", "assets/*.*"]
	exposed_files "README.md"
	exclude_encoding

	# Create a variety of releases, for all platforms.
	add_build :osx_app do
	  url "com.github.asteroids"
	  wrapper "wrappers/gosu-mac-wrapper-0.7.47.tar.gz" # Assuming this is where you downloaded this file.
	  add_package :tar_gz
	end

end
