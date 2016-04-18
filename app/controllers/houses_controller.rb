class HousesController < HalloweenController

	get "/houses" do
		erb :'houses/index'
	end

	get "/houses/new" do
		erb :'houses/new'
	end

	get "/houses/:id" do
		@house = House.find_by(id: params[:id])
		erb :'houses/show'
	end

	post "/houses" do
		house = House.create(address: params[:house][:address])
		house.save
		redirect "/houses/#{house.id}"
	end

	patch "/houses/:id/trick-or-treat" do
		house = House.find_by(id: params[:id])
		kid = Kid.find_by(id: params[:kid_id])
		house.give_candy(kid)
		redirect "/houses/#{house.id}"
	end

	patch "/houses/:id" do
		house = House.find_by(id: params[:id])
		house[:address] = params[:house][:address]
		house.save
		redirect "/houses/#{house.id}"
	end

end