json.array!(@bolhas) do |bolha|
  json.extract! bolha, :id, :title, :l_name, :r_name, :content
  json.url bolha_url(bolha, format: :json)
end
