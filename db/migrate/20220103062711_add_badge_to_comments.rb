class AddBadgeToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :badge, :string
  end
end
