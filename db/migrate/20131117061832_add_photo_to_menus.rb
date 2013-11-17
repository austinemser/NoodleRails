class AddPhotoToMenus < ActiveRecord::Migration
  def self.up
    add_attachment :menus, :photo
  end
  
  def self.down
    remove_attachment :menus, :photo
  end
end
