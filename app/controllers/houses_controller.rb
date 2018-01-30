class HousesController < HalloweenController
  get '/houses' do
    @houses = House.all
    erb :'houses/index'
  end

  get '/houses/new' do
    erb :'houses/new'
  end

  get '/houses/:id' do
    @house = House.find_by(params[:id])
    @kids = Kid.all
    erb :'houses/show'
  end

  post '/houses' do
    @house = House.create(:address => params["house"]["address"])
    @house.candies << Candy.create
    @house.save
    redirect to "/houses/#{@house.id}"
  end

  patch '/houses/:id' do
    @house = House.find_by(params[:id])
    @house.update(:address => params["house"]["address"])
    @house.save
    redirect to "/houses/#{@house.id}"
  end

  patch '/houses/:id/trick-or-treat' do
    @house = House.find_by(params[:id])
    @kid = Kid.find_by(:id => params[:kid_id])

    @house.give_candy(@kid)

    @house.update(:candies => @house.unclaimed_candies)

    @house.save

    redirect to "/houses/#{@house.id}"
  end


end
