class AddUserIdToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :user_id, :string
  end
end
