class AddPhotoUrlToUser < ActiveRecord::Migration
  def up
    add_column :users, :photo_url, :string
  end
end
