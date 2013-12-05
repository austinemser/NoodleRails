json.array!(@menus) do |menu|
  json.extract! menu, :title, :description, :calories, :imageURL
  json.url menu_url(menu, format: :json)
end
