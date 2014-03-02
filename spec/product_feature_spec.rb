require 'spec_helper'

describe 'Estimate total price for product with packaging:' do
  it 'Food item requires 3 people' do
    product = Product.new(1299.99, 3, :food)
    expect(product.total_price).to eq 1591.58
  end

  it 'Drugs requires 3 people' do
    product = Product.new(5432.00, 1, :pharmaceuticals)
    expect(product.total_price).to eq 6199.81
  end

  it 'Books requires 3 people' do
    product = Product.new(12456.95, 4, :books)
    expect(product.total_price).to eq 13707.63
  end
end