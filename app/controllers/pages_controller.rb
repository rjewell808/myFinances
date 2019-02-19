class PagesController < ApplicationController
  def home
  end

  def transaction
  	Transaction.create(input_type: params[:type].to_s, desc: params[:desc].to_s, amount: params[:amount].to_f)
  end
end
