class AddBadgeToAs < ActiveRecord::Migration[6.1]
  def change
    add_column :as, :badge, :string
  end
end
