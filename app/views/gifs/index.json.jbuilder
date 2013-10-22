json.array!(@gifs) do |gif|
  json.extract! gif, :url
  json.url gif_url(gif, format: :json)
end
