class AddPhotoUrlToUser < ActiveRecord::Migration
  def up
    add_column :users, :photo_url, :string, :default => "http://i.imgur.com/eolEt.jpg"
  end
end
