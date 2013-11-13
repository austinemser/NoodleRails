class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.text :description
      t.integer :calories

      t.timestamps
    end
  end
end
