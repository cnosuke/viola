class CreateItemFiles < ActiveRecord::Migration
  def change
    create_table :item_files do |t|
      t.references :item, index: true
      t.references :storage, index: true
      t.string :directory
      t.integer :flag

      t.timestamps
    end
  end
end
