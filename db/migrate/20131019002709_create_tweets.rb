class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :content
      t.string :timage
      t.timestamps
    end
  end
end
