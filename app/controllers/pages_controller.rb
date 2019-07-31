class PagesController < ApplicationController
  def transfers
    @transfers = Transfer.all.sort_by{|t| [t.date ? 1 : 0, t.date]}.reverse
  end

  def income
    params[:page_type] = "income"
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
    spendings = Transaction.where(input_type: "spending").sort_by{|t| [t.date ? 1 : 0, t.date] }.reverse

    @spending_total = 0
    @cash_spent_total = 0
    @check_spent_total = 0
    @savings_spent_total = 0

    @check_total = Transfer.where.not(checking: [0, nil]).sum(:checking)
    @cash_total = Transfer.where.not(cash: [0, nil]).sum(:cash)
    @savings_total = Transfer.where.not(savings: [0, nil]).sum(:savings)

    @trans.each do |t|
      if t.amount_type == "cash"
        @cash_total += t.amount
      elsif t.amount_type == "checking"
        @check_total += t.amount
      elsif t.amount_type == "savings"
        @savings_total += t.amount
      end
    end

    spendings.each do |t|
      if t.amount_type == "cash"
        @cash_spent_total += t.amount
      elsif t.amount_type == "checking"
        @check_spent_total += t.amount
      elsif t.amount_type == "savings"
        @savings_spent_total += t.amount
      end
    end

    @spending_total = @check_spent_total + @cash_spent_total + @savings_spent_total
  end

  def spending
    params[:page_type] = "spending"
    @spending_total = 0
    @cash_total = 0
    @check_total = 0
    @savings_total = 0
    @trans = Transaction.where(input_type: "spending").sort_by{|t| [t.date ? 1 : 0, t.date] }.reverse

    @trans.each do |t|
      if t.amount_type == "cash"
        @cash_total += t.amount
      elsif t.amount_type == "checking"
        @check_total += t.amount
      elsif t.amount_type == "savings"
        @savings_total += t.amount
      end
    end

    @spending_total = @check_total + @cash_total + @savings_total
  end

  def render_income
    respond_to do |format|
      format.js
    end
  end

  def render_spending
    respond_to do |format|
      format.js
    end
  end

  def render_transfer
    respond_to do |format|
      format.js
    end
  end

  def del_transfer
    Transfer.destroy(params[:id])
    redirect_back(fallback_location: "/transfers/")
  end

  def del_transaction
    Transaction.destroy(params[:id])
  end

  def transaction
  	amount = params[:amount].to_f
  	amount_type = "checking"

    if params[:trans_type] == "transfer"
      Transfer.create(
        desc: params[:desc].to_s,
        date: DateTime.strptime(params[:played_at],"%m/%d/%Y"),
        checking: params[:amount_checking],
        cash: params[:amount_cash],
        savings: params[:amount_savings]
      )

      respond_to do |format|
        format.js
      end
    end

  	if params[:trans_type] == "income"
  		amount_type = params[:amount_type]
  	elsif params[:trans_type] == "spending"
  		if !params[:amount_cash].blank?
  			amount = params[:amount_cash]
  			amount_type = "cash"
  		elsif !params[:amount_savings].blank?
        amount = params[:amount_savings]
        amount_type = "savings"
      end
  	end

    category = params[:category]

    if !params[:sub_category].blank?
      category = params[:sub_category]
    end
  	
  	Transaction.create(
  		input_type: params[:trans_type].to_s,
  		desc: params[:desc].to_s,
  		amount: amount,
  		date: DateTime.strptime(params[:played_at],"%m/%d/%Y"),
  		amount_type: amount_type,
      category: category
  	)

    respond_to do |format|
      format.js
    end
  end
end
