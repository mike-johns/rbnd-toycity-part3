class Customer
  attr_reader :name
  attr_accessor :sales

  @@customers = []

  def initialize(options = {})
    @name = options[:name]
    @sales = 0
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(search_name)
    @@customers.each {|customer| customer.name == search_name ? (return customer) : nil}
    puts "Sorry, no results for '#{search_name}'"
  end

  def purchase(product)
    product.stock > 0 ? Transaction.new(self, product) : raise(OutOfStockError, "'#{product.title}' is out of stock.")
  end

  def return(product)
    result = Transaction.find_all(customer: self, product: product)
    result.each do |transaction|
      if transaction.returned == false
        transaction.returned = true
        transaction.product.stock += 1
        puts "#{transaction.product.title} has been successfully returned (ID: #{transaction.id})"
        return true
      end
    end
  end

  private

  def add_to_customers
    @@customers.each {|customer| customer.name == @name ? raise(DuplicateCustomerError, "'#{@name}' already exists.") : nil}
    @@customers << self
  end
end
