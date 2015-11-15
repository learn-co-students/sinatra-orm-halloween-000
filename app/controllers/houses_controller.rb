class HousesController < HalloweenController
  get '/houses' do
  	erb :'houses/index'
  end

  get '/houses/new' do
  	erb :'houses/new'
  end
  
  post '/houses' do
    @house = House.create(params[:house])
    redirect "/houses/#{@house.id}"
  end	

  get '/houses/:id' do |id|
  	@house = House.find(id)
  	erb :'houses/show'
  end

  get '/houses/:id/edit' do |id|
  	@house = House.find(id)
  	erb :'houses/edit'
  end
  
  patch '/houses/:id' do |id|
  	@house = House.find(id)
    @house.update(params[:house])
    redirect "/houses/#{@house.id}"
  end

  patch '/houses/:id/trick-or-treat' do |id|
  	@house = House.find(id)
  	@kid = Kid.find(params[:kid_id])
  	@house.give_candy(@kid)
    redirect "/houses/#{@house.id}"
  end    	

end