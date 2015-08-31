class KidsController < HalloweenController

	get "/kids" do
		erb :'kids/index'
	end

	get "/kids/new" do
		erb :'kids/new'
	end

	get "/kids/:id" do
		@kid = Kid.find_by(id: params[:id])
		erb :'kids/show'
  end

	post "/kids" do
		kid = Kid.create(:name => (params[:kid][:name]), :age => (params[:kid][:age]))
		kid.save
		redirect "/kids/#{kid.id}"
	end

	patch '/kids/:id/pig-out' do
		kid = Kid.find_by(id: params[:id])
		number = params['consumption'].to_i
		kid.pig_out(number)
		redirect "/kids/#{kid.id}"
	end

end