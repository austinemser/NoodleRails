json.array!(@menus) do |menu|
  json.extract! menu, :title, :description, :calories
  json.url menu_url(menu, format: :json)
end
