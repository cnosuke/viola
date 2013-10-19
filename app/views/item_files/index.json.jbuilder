json.array!(@item_files) do |item_file|
  json.extract! item_file, :item_id, :storage_id, :directory, :flag
  json.url item_file_url(item_file, format: :json)
end
