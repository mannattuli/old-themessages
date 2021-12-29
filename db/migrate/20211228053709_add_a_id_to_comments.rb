class AddAIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :a_id, :integer
  end
end
