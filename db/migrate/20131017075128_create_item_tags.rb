class CreateItemTags < ActiveRecord::Migration
  def change
    create_table :item_tags do |t|
      t.references :item, index: true
      t.string :tag

      t.timestamps
    end
  end
end
