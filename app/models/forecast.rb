class forecast

  def initialize(options={})
    @forecast_date = Time.at(options[:dateTime]/1000)
    @high = options[:high]
    @low = options[:low]
    @has_day = options[:hasDay]
    @day = Dayforecast.new(options)
    @night = Nightforecast.new(options)
    @temp_unit = options[:temperatureUnits]
  end

  attr_accessor :high, :low, :forecast_date, :has_day, :day, :night, :temp_unit

end


class Dayforecast

  attr_accessor :desc, :icon, :pred
  def initialize(options = {})
  @desc = options[:dayDesc]
  @icon = options[:dayIcon]
  @pred = options[:dayPred]
  end
end
class Nightforecast

  attr_accessor :desc, :icon, :pred
  def initialize(options = {})
  @desc = options[:nightDesc]
  @icon = options[:nightIcon]
  @pred = options[:nightPred]
  end

end
