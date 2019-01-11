class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :type
      t.string :desc
      t.decimal :amount
      t.date :date
      t.string :category
      t.string :type

      t.timestamps
    end
  end
end
