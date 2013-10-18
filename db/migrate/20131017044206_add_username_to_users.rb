class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :image, :string
    add_column :users, :screen_name, :string
    add_column :users, :name, :string
  end
end
