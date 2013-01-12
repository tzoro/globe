# desc "Inspect included files from terminal"

namespace :globe do

	task :create => :environment  do
		puts Globe::World.new.create_world
	end

	task :test_include do
		puts $LOADED_FEATURES.inspect
	end

end
