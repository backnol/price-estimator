require 'spec_helper'

describe Product do
  let(:product) { Product.new(10.00, 0, :automotive) }

  describe '#flat_markup_price' do
    it 'returns calculated price with flat markup' do
      product.flat_markup_price.should eq 10.00 * 1.05
    end
  end

  describe '#people_markup' do
    it 'calculates markup of 1.2% per person involved' do
      product.people = 3
      expect(product.people_markup).to eq product.flat_markup_price * 3 * 1.2/100.0
    end
  end

  describe '#category_markup' do
    describe 'calculates markup based on the category: ' do
      it '13% for food' do
        product.category = :food
        expect(product.category_markup).to eq product.flat_markup_price * 13/100.0
      end

      it '2% for electronics' do
        product.category = :electronics
        expect(product.category_markup).to eq product.flat_markup_price * 2/100.0
      end

      it '7.5% for pharmaceuticals' do
        product.category = :pharmaceuticals
        expect(product.category_markup).to eq product.flat_markup_price * 7.5/100.0
      end

      it '0% for other categories' do
        expect(product.category_markup).to eq 0
      end
    end
  end


  describe '#total_price' do
    it 'adds flat 5% markup' do
      expect(product.total_price).to eq (10.00 * 1.05)
    end

    it 'adds respective category markup' do
      product.category = :food
      expect(product.total_price).to eq 11.87 # ((10.00 * 1.05) * 1.13)
    end

    it 'adds people markup' do
      product.people = 2
      expect(product.total_price).to eq 10.75 # ((10.00 * 1.05) * 1.024)
    end
  end
end