class AddAmountTypeToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :amount_type, :string
  end
end
