class Transaction
  attr_reader :id, :customer, :product

  @@transactions = []

  @@id = 1

  def initialize(customer, product)
    @customer = customer
    @product = product
    @product.stock -= 1
    @id = @@id
    @@transactions << self
    @@id += 1
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

  def customer
    @customer
  end

  def product
    @product
  end

end
