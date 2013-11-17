class AddAttachmentPhotoToMenus < ActiveRecord::Migration
  def self.up
    add_column :menus, :photo_file_name, :string
    add_column :menus, :photo_content_type, :string
    add_column :menus, :photo_file_size, :integer
    add_column :menus, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :menus, :photo_file_name
    remove_column :menus, :photo_content_type
    remove_column :menus, :photo_file_size
    remove_column :menus, :photo_updated_at
  end
end
