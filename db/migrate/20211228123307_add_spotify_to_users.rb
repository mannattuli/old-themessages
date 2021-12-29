class AddSpotifyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :spotify, :string
  end
end
