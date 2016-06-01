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
    @@products.each {|product| product.title == search_title ? (return product) : nil}
    puts "Sorry, no results for '#{search_title}'"
  end

  def self.in_stock
    products_in_stock = []
    @@products.each {|product| (product.stock != 0 && product.stock != nil) ? products_in_stock << product : nil}
    products_in_stock
  end

  def in_stock?
    if @stock == 0 || @stock == nil
      false
    else
      true
    end
  end

  private

  def add_to_products
    @@products.each {|product| product.title == @title ? raise(DuplicateProductError, "'#{@title}' already exists.") : nil}
    @@products << self
  end

end
