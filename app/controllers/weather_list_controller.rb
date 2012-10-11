class WeatherListController < UITableViewController

  CELL_ID = "CELL_ID"
  def viewDidLoad
  end


  #get the name of the location from the google api
  def display_location(location_url)
    BW::HTTP.get(location_url) do |response|
      location_json = BW::JSON.parse(response.body.to_str)
      address_components = location_json[:results][0][:address_components]
      parts = address_components.find_all {|ac| ac[:types].include?("locality")|| ac[:types].include?("administrative_area_level_1")}
      navigationItem.title = "#{parts[0][:short_name]}, #{parts[1][:short_name]}"
    end
  end

  def display_weather(forecasts)
    @forecasts = forecasts
    self.tableView.reloadData
  end

  #Tables need to know how many items to display
  def tableView(tableView, numberOfRowsInSection:section)
    @forecasts.count
  end

  #setup the cells so they know how to render themselves
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CELL_ID)
      cell
    end
    forecast = @forecasts[indexPath.row]
    cell.textLabel.text = "#{forecast.forecast_date.strftime("%a")} - #{'High:' + forecast.high + "," if forecast.has_day} Low:#{forecast.low}#{forecast.temp_unit}"
    #if we have a day icon, display it otherwise display the night icon
    if forecast.has_day
      weather_image = create_weather_image(forecast.day)
      cell.detailTextLabel.text = forecast.day.desc
    else
      weather_image = create_weather_image(forecast.night)
      cell.detailTextLabel.text = forecast.night.desc
    end
    cell.imageView.image = weather_image
    cell
  end

  #tell the application what to do when someone clicks on a cell
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    forecast = @forecasts[indexPath.row]
    controller = UIApplication.sharedApplication.delegate.weather_show_controller
    navigationController.pushViewController(controller, animated:true)
    controller.setforecast(forecast)
  end
  
end
