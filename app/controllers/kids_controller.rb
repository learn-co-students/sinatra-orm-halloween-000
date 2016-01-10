class KidsController < HalloweenController

  get '/kids' do

    erb :"kids/index"
  end

  post '/kids' do
    @kid = Kid.create(name: params[:kid][:name],
               age: params[:kid][:age] ,
               feeling: params[:kid][:feeling]
              )

    redirect to("/kids/#{@kid.id}")
  end

  get '/kids/new' do

    erb :"kids/new"
  end

  get '/kids/:id' do
    @kid = Kid.find_by(id: params[:id])

    erb :"kids/show"
  end

  patch '/kids/:id/pig-out' do
    @kid = Kid.find_by(id: params[:id])
    @kid.pig_out(params[:consumption].to_i)
    redirect to("/kids/#{@kid.id}")
  end

end