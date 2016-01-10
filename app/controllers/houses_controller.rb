class HousesController < HalloweenController

  get '/houses' do
    
    erb :'houses/index'  
  end

  post '/houses' do
    new_house = House.create(address: params[:house][:address])

    redirect to("houses/#{new_house.id}")
  end

  get '/houses/new' do

    erb :'houses/new'  
  end


  get '/houses/:id' do
    @house = House.find_by(id: params[:id])

    erb :'houses/show'  
  end

  patch '/houses/:id' do
    house = House.find_by(id: params[:id])
    house.update(address: params[:house][:address])

    redirect to("houses/#{house.id}")  
  end

  patch '/houses/:id/trick-or-treat' do
    kid = Kid.find_by(id: params[:kid_id])
    house = House.find_by(id: params[:id])

    house.give_candy(kid)

    redirect to("houses/#{house.id}")
  end

end