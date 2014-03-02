class Product
  CATEGORY_MARKUPS = { pharmaceuticals: 7.5, food: 13, electronics: 2 }

  attr_accessor :people, :category, :flat_markup_price, :base_price

  def initialize(base_price, people, category)
    @base_price = base_price
    @flat_markup_price = base_price * 1.05
    @people = people
    @category = category
  end

  def people_markup
    flat_markup_price * people * 1.2/100.0
  end

  def category_markup
    category_markup_percentage = Product::CATEGORY_MARKUPS[category] || 0
    flat_markup_price * category_markup_percentage/100.0
  end

  def total_price
    (flat_markup_price + people_markup + category_markup).round(2)
  end
end