class PagesController < ApplicationController
  def income
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

    @trans = Transaction.where(input_type: "income").sort_by{|t| [t.date ? 1 : 0, t.date] }.reverse

    @check_total = 0
    @cash_total = 0 

    @trans.each do |t|
      if t.amount_type == "cash"
        @cash_total += t.amount
      elsif t.amount_type == "checking"
        @check_total += t.amount
      end
    end
  end

  def spending
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

    respond_to do |format|
      format.js
    end
  end
end
