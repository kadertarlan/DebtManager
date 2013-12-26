class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.string :from
      t.integer :to_id
      t.string :amount
      t.date :deadline

      t.timestamps
    end
  end
end
