require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do 
    context "on a new user" do 
      it "should not be valid without a password" do 
        user = User.new password: nil, password_confirmation: nil
        expect(user).to_not be_valid
      end
    
      it 'should not be valid with a password under 8 characters' do 
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

      it 'should not be valid if email already exists' do 
        user1 = User.new password: 'thisisapassword', password_confirmation: 'thisisapassword', email: 'test@test.com', first_name: 'alex', last_name: 'hungry'
        user1.save! 
        user2 = User.new password: 'passwordisthis', password_confirmation: 'passwordisthis', email: 'test@test.com', first_name: 'alex', last_name: 'hippo'
        expect(user2).to_not be_valid
      end

      it 'should not be valid if first_name is not present' do 
        user = User.new password: '123456789', password_confirmation:'123456789', email: 'test@test2.com', first_name: nil, last_name: "petey"
        expect(user).to_not be_valid
      end

      it 'should not be valid if last_name is not present' do 
        user = User.new password: '123456789', password_confirmation: '123456789', email: 'testy@test.com', first_name: 'alex'
        expect(user).to_not be_valid
      end
    end
 
  end
end
