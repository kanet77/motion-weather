class Location
  def initialize(options={})
    @city = options[:city]
    @state = options[:state]
    @zipcode = options[:zipcode]
  end
  attr_accessor :city
  attr_accessor :state
  attr_accessor :zipcode
end
