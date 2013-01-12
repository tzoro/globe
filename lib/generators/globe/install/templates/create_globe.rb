class CreateGlobe < ActiveRecord::Migration

	def change
		create_table :globe_regions do |table|
			table.integer :RegionId
			table.integer :CountryId
			table.string :Region
			table.string :Code
			table.string :ADM1Code
			table.timestamps
		end
		add_index :globe_regions, :RegionId
		add_index :globe_regions, :CountryId

		create_table :globe_cities do |table|
				table.integer :CityId
				table.integer :CountryID
				table.integer :RegionID
				table.string :City
				table.decimal :Latitude, :precision => 15, :scale => 10
				table.decimal :Longitude, :precision => 15, :scale => 10
				table.string :TimeZone
				table.integer :DmaId
				table.string :Code
				table.timestamps
		end
		add_index :globe_cities, :CityId
		add_index :globe_cities, :CountryID
		add_index :globe_cities, :RegionID

		create_table :globe_countries do |table|
			table.integer :CountryId
			table.string :Country
			table.string :FIPS104
			table.string :ISO2
			table.string :ISO3
			table.integer :ISON
			table.string :Internet
			table.string :Capital
			table.string :MapReference
			table.string :NationalitySingular
			table.string :NationalityPlural
			table.string :Currency
			table.string :CurrencyCode
			table.integer :Population
			table.string :Title
			table.string :Comment
			table.timestamps
		end
		add_index :globe_countries, :CountryId
	end

end
