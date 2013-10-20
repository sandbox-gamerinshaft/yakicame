class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :tweet_id
      t.string :user_id

      t.timestamps
    end
  end
end
