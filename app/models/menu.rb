class Menu < ActiveRecord::Base
  validates :title, :presence =>true, :uniqueness => true
  
  has_attached_file :photo
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
end
  