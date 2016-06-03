class Transaction
  attr_reader :id, :customer, :product
  attr_accessor :returned

  @@transactions = []

  @@id = 1

  def initialize(customer, product)
    customer.class != Customer ? (@customer = Customer.find_by_name(customer)) : @customer = customer
    product.class != Product ? (@product = Product.find_by_title(product)) : @product = product
    validate_transaction
    add_to_transactions
    @returned = false
    @id = @@id
    @customer.sales += 1
    @@id += 1
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find {|transaction| transaction.id == id}
  end

  def self.find_all(customer: customer, product: product)
    customer.class != Customer ? (customer = Customer.find_by_name(customer)) : nil
    product.class != Product ? (product = Product.find_by_title(product)) : nil
    @@transactions.find_all {|transaction| (transaction.customer == customer && transaction.product == product)}
  end

  def customer
    @customer
  end

  def product
    @product
  end

  private

  def validate_transaction
    @product.stock > 0 ? @product.stock -= 1 : raise(OutOfStockError, "'#{product.title}' is out of stock.")
  end

  def add_to_transactions
    @@transactions << self
  end

end
