class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.integer :folder_id
      t.integer :size

      t.timestamps
    end
  end
end
