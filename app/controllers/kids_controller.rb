class KidsController < HalloweenController
  get '/kids' do
  	erb :'kids/index'
  end

  get '/kids/new' do
  	erb :'kids/new'
  end

  post '/kids' do
  	@kid = Kid.create(params[:kid])
  	@kid.create_bucket
  	redirect "/kids/#{@kid.id}"
  end

  get '/kids/:id' do |id|
  	@kid = Kid.find(id)
  	erb :'kids/show'
  end

  patch '/kids/:id/pig-out' do |id|
  	@kid = Kid.find(id)
    @kid.pig_out(params[:consumption].to_i)
  	redirect "/kids/#{@kid.id}"
  end

end