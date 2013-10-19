json.array!(@items) do |item|
  json.extract! item, :filename, :file_size, :file_created_at, :file_updated_at, :file_hash, :format, :title, :subtitle, :number, :released_at, :duration_sec, :description, :log, :flag
  json.url item_url(item, format: :json)
end
