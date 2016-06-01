class Transaction
  attr_reader :id, :customer, :product
  attr_accessor :returned

  @@transactions = []

  @@id = 1

  def initialize(customer, product)
    @customer = customer
    @product = product
    @product.stock -= 1
    @returned = false
    @id = @@id
    @@transactions << self
    @@id += 1
    customer.sales += 1
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    if id.class == Fixnum
      @@transactions.each {|transaction| transaction.id == id ? (return transaction) : nil}
      puts "Sorry, no transaction found with an ID of #{id}"
    else
      puts "Oops - it looks like you used a #{id.class}. Try again with a number."
    end
  end

  def self.find_all(customer: customer, product: product)
    result = []
    customer.class != Customer ? (customer = Customer.find_by_name(customer)) : nil
    product.class != Product ? (product = Product.find_by_title(product)) : nil
    @@transactions.each {|transaction| (transaction.customer == customer && transaction.product == product) ? (result << transaction) : nil}
    result != [] ? (return result) : (puts "Sorry, no transaction record found.")
  end

  def customer
    @customer
  end

  def product
    @product
  end

end
