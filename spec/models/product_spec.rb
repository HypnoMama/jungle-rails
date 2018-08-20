require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    it 'should not be valid without a name' do 
      @newProduct = Product.new(name: nil)
      expect(@newProduct).to_not be_valid
    end
  
    it 'should be valid with all attributes present' do 
      @category = Category.new({name: "fun stuff"})
      @category.save!
      @newProduct = Product.new({name: 'yellow submarine', price_cents: 123546, quantity: 45, category: @category})
      @newProduct.save!
      expect(@newProduct).to be_valid
    end

    it 'should not be valid without a name present' do 
      @category = Category.new({name: "fun stuff"})
      @category.save!
      @newProduct = Product.new({name: nil, price_cents: 123546, quantity: 45, category: @category})
      @newProduct.valid?
      expect(@newProduct).to_not be_valid 
    end

    it 'should not be valid without a price' do 
      @category = Category.new({name: "fun stuff"})
      @category.save!
      @newProduct = Product.new({name: 'yellow submarine', price_cents: nil, quantity: 45, category: @category})
      expect(@newProduct).to_not be_valid 
    end
  
    it 'should not be valid without a quantity' do 
      @category = Category.new({name: "fun stuff"})
      @category.save!
      @newProduct = Product.new({name: 'yellow submarine', price_cents: 12345, quantity: nil, category: @category})
      expect(@newProduct).to_not be_valid 
    end

    it 'should not be valid without a category' do 
      @newProduct = Product.new({name: 'yellow submarine', price_cents: 12345, quantity: nil, category: nil})
      expect(@newProduct).to_not be_valid 
    end
  end
end
