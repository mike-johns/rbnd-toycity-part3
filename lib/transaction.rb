class Transaction
  attr_reader :id, :customer, :product

  @@transactions = []

  @@id = 1

  def initialize(customer, product)
    @customer = customer
    @product = product
    @product.stock -= 1 #This will be replaced with a private method
    @id = @@id
    @@transactions << self
    @@id += 1
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.each {|transaction| transaction.id == id ? (return transaction) : nil}
    puts "No transaction found."
  end

  def customer
    @customer
  end

  def product
    @product
  end

end
