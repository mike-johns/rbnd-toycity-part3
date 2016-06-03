class Product
  attr_reader :title, :price

  attr_accessor :stock

  @@products = []

  def initialize(options = {})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(search_title)
    @@products.find {|product| product.title == search_title}
  end

  def self.in_stock
    @@products.find_all {|product| product.stock > 0}
  end

  def in_stock?
    @stock > 0
  end

  private

  def add_to_products
    if @@products.find(-> {false}) {|product| product.title == @title}
      raise(DuplicateProductError, "'#{@title}' already exists.")
    else
      @@products << self
    end
  end

end
