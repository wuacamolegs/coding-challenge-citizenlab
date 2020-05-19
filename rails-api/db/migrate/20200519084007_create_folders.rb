class CreateFolders < ActiveRecord::Migration[6.0]
  def change
    create_table :folders do |t|
      t.string  :title, null: false
      t.string  :description, null: false
      t.integer :parent_id, index: true

      t.timestamps null: false
    end
  end
end
