class Teacher < ActiveRecord::Base

  has_many :parents
  has_secure_password

  validates :password, length: { maximum: 30 }
  validates_confirmation_of :password

end
