class Menu < ActiveRecord::Base
  validates :title, :presence =>true, :uniqueness => true
  
  has_attached_file :photo, :styles => { :small => "150x150>"},
                            :url => "/assets/menus/:id/:style/:basename.:extension"
                            :path => ":rails_root/public/assets/menus/:id/:style/:basename.:extension"
  
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
end
  