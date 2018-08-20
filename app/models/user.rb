class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :password, presence: true
  validates :password, presence: true, confirmation:  { case_sensitive: true }, length: { minimum: 8 } 
  validates :email, presence: true, confirmation: { case_sensitive: true }#, uniqueness: true
    

end
