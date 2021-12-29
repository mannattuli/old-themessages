class CreateAs < ActiveRecord::Migration[6.1]
  def change
    create_table :as do |t|
      t.string :subject
      t.string :body
      t.string :image

      t.timestamps
    end
  end
end
