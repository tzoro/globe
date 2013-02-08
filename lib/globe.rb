require 'railtie' if defined?(Rails)
require 'active_record'

module Globe

	class City < ActiveRecord::Base
		self.table_name = 'globe_cities'
		attr_accessible :CityId, :CountryID, :RegionID, :City, :Longitude, :Latitude, :TimeZone, :DmaId, :Code
		belongs_to :country, :class_name => 'Country', :primary_key => 'CountryId', :foreign_key => 'CountryId'
		belongs_to :region, :class_name => 'Region', :primary_key => 'RegionID', :foreign_key => 'RegionId'
	end

	class Country < ActiveRecord::Base
		self.table_name = 'globe_countries'
		attr_accessible :CountryId, :Country, :FIPS104, :ISO2, :ISO3, :ISON, :Internet, :Capital, :MapReference, :NationalitySingular, :NationalityPlural, :Currency, :CurrencyCode, :Population, :Title, :Comment
		has_many :cities, :class_name => 'City', :primary_key => 'CountryId', :foreign_key => 'CountryId'
		has_many :regions, :class_name => 'FotballPick', :primary_key => 'CountryId', :foreign_key => 'CountryId'
	end

	class Region < ActiveRecord::Base
		self.table_name = 'globe_regions'
		attr_accessible :RegionId, :CountryId, :Region, :Code, :ADM1Code
		belongs_to :country, :class_name => 'Country', :primary_key => 'CountryId', :foreign_key => 'CountryId'
	end

	class World

		def create_world
			city = Globe::City
			region = Globe::Region
			country = Globe::Country
			create_resource(city, 'CityId', 'cities.txt')
			create_resource(region, 'RegionId', 'regions.txt')
			create_resource(country, 'CountryId', 'countries.txt')
		end

		private

		def create_resource(resourceObject, dbIndentifier, filename)
			object = resourceObject
			attributes = object.new.attribute_names

			path = File.expand_path("../..", __FILE__) + '/globe/vendor/GeoWorldMap/' + filename
			file = File.open(path, 'r:Windows-1252').read
			file.gsub!(/\r?/, '')

			file.each_line.with_index do |line, index|
				next if index == 0
				data = line.split(',')
				record = object.where(dbIndentifier => data[0]).first 

				if record == nil
					record = object.new
					action = 'create'
				else
					action = 'update'
				end

				cleanData = clean_array(data)
				attrs = attributes - ['id', 'created_at', 'updated_at']
				h = Hash[attrs.zip cleanData]
				record.update_attributes(h)
				record.save
				puts 'line:' + index.to_s + ' | ' + action + ' | type:' + record.class.name
			end

			return
		end

		def clean_value(value)	
			return value.delete!('"')
		end

		def clean_array(array)
			array.each do |element|
				element = clean_value(element)
			end
			return array
		end

	end

end
