class Teacher < ActiveRecord::Base

  has_many :parents
  has_secure_password

  validates :password, :length => { :minimum => 8}
  validates_confirmation_of :password



end
