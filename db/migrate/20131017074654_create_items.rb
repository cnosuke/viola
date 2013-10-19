class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :filename
      t.integer :file_size, limit:8
      t.datetime :file_created_at
      t.datetime :file_updated_at
      t.string :file_hash
      t.string :format
      t.string :title
      t.string :subtitle
      t.string :number
      t.datetime :released_at
      t.integer :duration_sec
      t.text :description
      t.text :log
      t.integer :flag

      t.timestamps
    end
  end
end
