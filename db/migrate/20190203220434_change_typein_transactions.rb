class ChangeTypeinTransactions < ActiveRecord::Migration[5.2]
  def change
  	remove_column :transactions, :type
  	add_column :transactions, :input_type, :string
  end
end
