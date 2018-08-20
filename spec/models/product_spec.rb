require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'should be valid if all attributes are present' do
      newCat = Category.new
      expect(Product.new(name: 'Steve', price: 1000, quantity: 50, category: newCat)).to be_valid

      product = Product.new
      product.save

    end

    it 'should be invalid if the name attribute is not present' do
      newCat = Category.new
      expect(Product.new(name: nil, price: 1000, quantity: 50, category: newCat)).to be_invalid

      product = Product.new
      product.save

    end

    it 'should be invalid if the price attribute is not present' do
      newCat = Category.new
      expect(Product.new(name: 'Steve', price: nil, quantity: 50, category: newCat)).to be_invalid

      product = Product.new
      product.save

    end

    it 'should be invalid if the quantity attribute is not present' do
      newCat = Category.new
      expect(Product.new(name: 'Steve', price: 1000, quantity: nil, category: newCat)).to be_invalid

      product = Product.new
      product.save

    end

    it 'should be invalid if the category attribute is not present' do
      newCat = Category.new
      expect(Product.new(name: 'Steve', price: 1000, quantity: 50, category: nil)).to be_invalid

      product = Product.new
      product.save

    end

  end

end
