class ItemFile < ActiveRecord::Base
  belongs_to :item
  belongs_to :storage

  scope :where_by_filename_with_storage_and_directory, ->(stor, dir, filename){
    includes(:item)
      .where(storage_id: stor.id, directory: dir)
      .where("items.filename = ?", filename)
  }

  def self.check_deleted_or_modified(stor, dir)
    where(storage_id: stor.id, directory: dir).each do |item_file|
      filename = item_file.item.filename
      filepath = stor.path + item_file.directory + "/" + filename

      if File.exists?(filepath) then
        if  File.size(filepath) != item_file.item.file_size || 
          File.ctime(filepath).to_i != item_file.item.file_created_at.to_i ||
          File.mtime(filepath).to_i != item_file.item.file_updated_at.to_i then
          puts "modified : " + filename
          item_file.destroy
        end

      else
        puts "deleted: " + filename
        item_file.destroy
      end
    end
  end
end
