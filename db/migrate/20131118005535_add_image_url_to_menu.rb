class AddImageUrlToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :imageURL, :string
  end
end
