class Customer
  attr_reader :name
  attr_accessor :sales, :returns

  @@customers = []

  def initialize(options = {})
    @name = options[:name]
    @sales = 0
    @returns = 0
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(search_name)
    @@customers.find {|customer| customer.name == search_name}
  end

  def purchase(product)
    Transaction.new(self, product)
  end

  def return(product)
    result = Transaction.find_all(customer: self, product: product)
    result.each do |transaction|
      if transaction.returned == false
        transaction.returned = true
        transaction.product.stock += 1
        puts "#{transaction.product.title} has been successfully returned (ID: #{transaction.id})"
        @returns += 1
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
