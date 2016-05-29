class Customer
  attr_reader :name

  @@customers = []

  def initialize(options = {})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(search_name)
    @@customers.each {|customer| customer.name == search_name ? (return customer) : nil}
    puts "No customer found."
  end

  def purchase(product)
    Transaction.new(customer: self, product: product)
  end

  private

  def add_to_customers
    @@customers.each {|customer| customer.name == @name ? raise(DuplicateCustomerError, "'#{@name}' already exists.") : nil}
    @@customers << self
  end
end
