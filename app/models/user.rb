class User < ActiveRecord::Base
  has_secure_password
  
  validates :password, presence: true
  validates :password, presence: true, confirmation:  { case_sensitive: true }, length: { minimum: 8 } 
  validates :email, presence: true, uniqueness: true, confirmation: { case_sensitive: false }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    password = password.strip
    @user = User.find_by(email: email) 
    if @user && @user.authenticate(password)    
      @user 
    else 
      nil 
    end
  end


end
