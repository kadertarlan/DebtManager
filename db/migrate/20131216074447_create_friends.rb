class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :surname
      t.string :twitterUsername

      t.timestamps
    end
  end
end
