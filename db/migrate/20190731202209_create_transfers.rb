class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.string :desc
      t.decimal :cash
      t.decimal :savings
      t.decimal :checking
      t.date :date

      t.timestamps
    end
  end
end
