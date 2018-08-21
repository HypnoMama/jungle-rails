require 'rails_helper'

RSpec.feature "Visitor navigates to product show page", type: :feature, js: true do


  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        image: open_asset('apparel1.jpg'),
        price: 64.99
      )
    end

    @user = User.create! first_name: 'Sarah', last_name: 'Hermsen', email: 'sarahhermsen@gmail.com', password: '123456789', password_confirmation: '123456789'


  end

  scenario "They can login and are taken back to products page" do
    # ACT
    visit root_path
    first('.nav.navbar-nav.navbar-right').find_link('Log In').click
    
    within 'form' do 
      fill_in id: 'email', with: 'sarahhermsen@gmail.com'
      fill_in id: 'password', with: '123456789'
      
      first('.btn').click
    end

    sleep 5

    # DEBUG / VERIFY
    save_screenshot 'user_login.png'
    expect(page).to have_content 'Hello Sarah'
    expect(page).to have_no_content 'Log In'

  end


end