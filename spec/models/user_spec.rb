require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do 
    context "on a new user" do 
      it "should not be valid without a password" do 
        user = User.new password: nil, password_confirmation: nil
        expect(user).to_not be_valid
      end
    
      it 'should not be valid with a short password' do 
        user = User.new password: 'short', password_confirmation: 'short'
        expect(user).to_not be_valid 
      end

      it 'shoud not be valid with a password and confirmation mismatch' do 
        user = User.new password: 'thisisapassword', password_confirmation: 'short'
        expect(user).to_not be_valid
      end

      it 'should not be valid if password confirm is blank' do 
        user = User.new password: 'thisisapassword', password_confirmation: nil 
        expect(user).to_not be_valid 
      end

      it 'should not be valid if password is blank' do 
        user = User.new password: nil, password_confirmation: 'thisisapassword' 
        expect(user).to_not be_valid 
      end

    

    end
 
  end
end
