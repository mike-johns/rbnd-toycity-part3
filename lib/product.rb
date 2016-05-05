class Product
  attr_reader :title

  @@products = []

  def initialize(options = {})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    @@products.each {|product| product.title == @title ? raise(DuplicateProductError, "'#{@title}' already exists.") : nil}
    @@products << self
  end

end
