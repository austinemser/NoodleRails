class Menu < ActiveRecord::Base
  before_save :change_photo_filename, :save_image_url
  
  validates :title, :presence =>true, :uniqueness => true
  
  has_attached_file :photo, :styles => { :small => "150x150>"}
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  private
    def change_photo_filename
      extension = File.extname(photo_file_name).downcase
      self.photo.instance_write :file_name, "#{self.title}#{extension}"
    end
    
    def save_image_url
      extension = File.extname(photo_file_name).downcase
      titleForUrl = self.title.tr(' ', '+')
      self.imageURL = "https://s3.amazonaws.com/noodle_image/menus/photos/#{titleForUrl}#{extension}"
    end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
end
  