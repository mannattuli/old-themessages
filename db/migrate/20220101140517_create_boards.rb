class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :board_short_name
      t.string :board_desc

      t.timestamps
    end
  end
end
