class PagesController < ApplicationController
  def home
  	@categories = {
  		"Automotive"=>[],
  		"Food"=>["Break Food", "Grocery", "Movies", "Restaurant"],
  		"Gifts"=>["Birthday", "Christmas"],
  		"Hobbies"=>["Lego"],
  		"Movies"=>["Theaters", "Rental", "Bluray"],
  		"PC_Gaming"=>["Games", "Systems", "Parts"],
  		"Phone"=>[],
  		"School"=>[],
  		"Other"=>[]
  	}
  end

  def transaction
  	amount = params[:amount].to_f
  	amount_type = "checking"

  	if params[:type] == "income"
  		amount_type = params[:amount_type]
  	elsif params[:type] == "spending"
  		if !params[:amount_cash].blank?
  			amount = params[:amount_cash]
  			amount_type = "cash"
  		end
  	end
  		


  	Transaction.create(
  		input_type: params[:type].to_s,
  		desc: params[:desc].to_s,
  		amount: amount,
  		date: DateTime.strptime(params[:played_at],"%m/%d/%Y"),
  		amount_type: amount_type
  	)
  end
end
