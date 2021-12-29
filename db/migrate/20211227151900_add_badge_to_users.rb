class AddBadgeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :badge, :string
  end
end
