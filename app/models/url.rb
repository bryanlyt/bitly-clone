class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
validates :long_url, presence: true
validates :long_url, uniqueness: true

def shorten
	if self.unique_key = nil
		self.unique_key = create_unique_key
	end
end

def create_unique_key
	key = Key.new(6){[*"A".."Z", *"0".."9"].sample}.join
end

def self.validate_input(input)
	row = Url.new
end
end