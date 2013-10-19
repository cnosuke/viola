json.array!(@storages) do |storage|
  json.extract! storage, :name, :path, :description, :device
  json.url storage_url(storage, format: :json)
end
