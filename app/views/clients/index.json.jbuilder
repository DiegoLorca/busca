json.array!(@clients) do |client|
  json.extract! client, :id, :latitude, :longitude, :address, :description, :title
  json.url client_url(client, format: :json)
end
