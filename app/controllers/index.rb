get '/' do
	# let user create new short URL, display a list of shortened URL
	@url = Url.all.order(id: :desc)
	erb :index
end

post '/urls' do
	# create a new URL
	@url = Url.create(long_url: params[:input])
	# p "[LOG] Errors? = #{@url.errors.any?}"
	# if @url.errors.any?
	# 	@url = Url.all.order(:id)
	# 	erb :index
	# else
	redirect to '/'
	# end
end

# ie: /q6bda
get '/:short_url' do
	#redirect to appropriate "long" URL
	@url = Url.find_by(unique_key: params[:short_url])
	@url.click_count += 1
	@url.save
	redirect "http://#{@url.long_url}"
	# 
end



