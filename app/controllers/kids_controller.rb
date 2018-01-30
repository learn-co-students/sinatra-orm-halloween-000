class KidsController < HalloweenController
  get '/kids' do
    @kids = Kid.all
    erb :'kids/index'
  end

  get '/kids/new' do
    erb :'kids/new'
  end

  get '/kids/:id' do
    @kid = Kid.find_by(params[:id])

    erb :'kids/show'
  end

  post '/kids' do
    @kid = Kid.create(:name => params["kid"]["name"], :age => params["kid"]["age"])
    @kid.bucket = Bucket.create
    @kid.save
    redirect to "/kids/#{@kid.id}"
  end

  patch '/kids/:id/pig-out' do
    @kid = Kid.find_by(params[:id])
    new_feeling = @kid.pig_out((params[:consumption]).to_i)
    @kid.update(:feeling => new_feeling)
    @kid.save
    redirect to "/kids/#{@kid.id}"
  end
end
