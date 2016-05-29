class Transaction
  attr_reader :id, :customer, :product

  @@transactions = []

  @@id = 1

  def initialize(options = {})
    @id = @@id
    @customer = options[:customer]
    @product = options[:product]
    @product.stock -= 1
    @@id += 1
  end

  def customer
    @customer
  end

  def product
    @product
  end







end
