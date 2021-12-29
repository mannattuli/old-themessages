class AddUserIdToAs < ActiveRecord::Migration[6.1]
  def change
    add_column :as, :user_id, :integer
    add_index :as, :user_id
  end
end
