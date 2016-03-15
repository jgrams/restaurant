json.array!(@rests) do |rest|
  json.extract! rest, :id, :name, :address, :description, :owner, :phone
  json.url rest_url(rest, format: :json)
end
