class CreateItemProps < ActiveRecord::Migration
  def change
    create_table :item_props do |t|
      t.references :item, index: true
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
