class Transaction
  attr_reader :id, :customer, :product

  @@transactions = []

  @@id = 1

  def initialize(customer, product)
    @customer = customer
    @product = product
    @product.stock -= 1
    @id = @@id
    @@id += 1
  end

  def customer
    @customer
  end

  def product
    @product
  end







end
