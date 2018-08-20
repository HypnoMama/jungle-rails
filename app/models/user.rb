class User < ActiveRecord::Base
  has_secure_password
  
  validates :password, presence: true
  validates :password, presence: true, confirmation:  { case_sensitive: true }, length: { minimum: 8 } 
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

end
