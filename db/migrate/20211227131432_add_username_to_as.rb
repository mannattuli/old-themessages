class AddUsernameToAs < ActiveRecord::Migration[6.1]
  def change
    add_column :as, :username, :string
  end
end
