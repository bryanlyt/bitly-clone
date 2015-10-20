require 'byebug'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
validates :long_url, presence: true
validates :long_url, uniqueness: true
before_create :shorten

def shorten
	if self.unique_key == nil
		
		self.unique_key = create_unique_key
	end
end

def create_unique_key
	key = [*"A".."Z", *"0".."9"]
	key.sample(6).join

	# key = (6){[*"A".."Z", *"0".."9"].sample}.join
end
end