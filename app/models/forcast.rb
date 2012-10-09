class Forcast

  def initialize(options={})
    @forcast_date = Time.at(options[:dateTime]/1000)
    @high = options[:high]
    @low = options[:low]
    @has_day = options[:hasDay]
    @day = DayForcast.new(options)
    @night = NightForcast.new(options)
    @temp_unit = options[:temperatureUnits]
  end

  attr_accessor :high, :low, :forcast_date, :has_day, :day, :night, :temp_unit

end


class DayForcast

  attr_accessor :desc, :icon, :pred
  def initialize(options = {})
  @desc = options[:dayDesc]
  @icon = options[:dayIcon]
  @pred = options[:dayPred]
  end
end
class NightForcast

  attr_accessor :desc, :icon, :pred
  def initialize(options = {})
  @desc = options[:nightDesc]
  @icon = options[:nightIcon]
  @pred = options[:nightPred]
  end

end
