require 'rails'

module Globe
	class Railtie < Rails::Railtie
		railtie_name :globe

		rake_tasks do
			load 'tasks/globe_tasks.rake'
		end
	end
end