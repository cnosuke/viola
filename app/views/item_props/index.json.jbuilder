json.array!(@item_props) do |item_prop|
  json.extract! item_prop, :item_id, :name, :value
  json.url item_prop_url(item_prop, format: :json)
end
