class RemoveParentIdFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :a_id, :integer
  end
end
