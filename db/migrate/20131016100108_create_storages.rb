class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :name
      t.string :path
      t.string :description
      t.integer :device

      t.timestamps
    end
  end
end
