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
  end

  scenario "They see one product" do
    # ACT
    visit root_path
    first('article.product .btn').click

    sleep 5

    # DEBUG / VERIFY
    save_screenshot 'product_cart_test.png'
    # expect(page).to have_css '.products-show'
  end

end