class CreateItemThumbnails < ActiveRecord::Migration
  def change
    create_table :item_thumbnails do |t|
      t.references :item, index: true
      t.integer :time_sec
      t.string :image_filename

      t.timestamps
    end
  end
end
