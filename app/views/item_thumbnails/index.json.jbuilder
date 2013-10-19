json.array!(@item_thumbnails) do |item_thumbnail|
  json.extract! item_thumbnail, :item_id, :time_sec, :image_filename
  json.url item_thumbnail_url(item_thumbnail, format: :json)
end
