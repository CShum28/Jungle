require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'should validate name as true' do
      category = Category.new(name: 'flower')
      product = Product.new(
        name: "Rose",
        description: "A flower",
        image: "rose.jpg",
        price_cents: 1000,     
        quantity: 10,        
        category_id: nil
      )
      expect(product.name).to be_truthy
    end

    it 'should validate price as true' do
      category = Category.new(name: 'flower', id: 1)
      product = Product.new(
        name: "Rose",
        description: "A flower",
        image: "rose.jpg",
        price_cents: 1000,     
        quantity: 10,        
        category_id: category.id
      ) 
      expect(product.price_cents).to be_truthy
    end

    it 'should validate quantity as true' do
      category = Category.new(name: 'flower', id: 1)
      product = Product.new(
        name: "Rose",
        description: "A flower",
        image: "rose.jpg",
        price_cents: 1000,     
        quantity: 10,        
        category_id: category.id
      ) 
      expect(product.quantity).to be_truthy
    end

    it 'should validate category as true' do
      category = Category.new(name: 'flower', id: 1)
      product = Product.new(
        name: "Rose",
        description: "A flower",
        image: "rose.jpg",
        price_cents: 1000,     
        quantity: 10,        
        category_id: category.id
      ) 
      expect(product.category_id).to be_truthy
    end

    it 'should display an error message' do
      product = Product.new(description: "A flower", price_cents: 1000, quantity: 10)

      # Validate the product instance
      product.valid?
  
      # Test that the specific error message is included in the errors.full_messages array
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
  end
end
