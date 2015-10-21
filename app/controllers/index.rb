get '/' do
	# let user create new short URL, display a list of shortened URL
	@url = Url.all
	erb :index
end

post '/urls' do
	# create a new URL
	@url = Url.create(long_url: params[:input])
	redirect to '/'
end

# ie: /q6bda
get '/:short_url' do
	#redirect to appropriate "long" URL
	@url = Url.find_by(unique_key: params[:short_url])
	redirect "http://#{@url.long_url}"
	# 
end


