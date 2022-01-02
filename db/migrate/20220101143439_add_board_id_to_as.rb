class AddBoardIdToAs < ActiveRecord::Migration[6.1]
  def change
    add_column :as, :board_id, :integer
  end
end
