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

  def display_weather(forcasts)
    @forcasts = forcasts
    self.tableView.reloadData
  end

  #Tables need to know how many items to display
  def tableView(tableView, numberOfRowsInSection:section)
    @forcasts.count
  end

  #setup the cells so they know how to render themselves
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CELL_ID)
      cell
    end
    forcast = @forcasts[indexPath.row]
    cell.textLabel.text = "#{forcast.forcast_date.strftime("%a")} - #{'High:' + forcast.high + "," if forcast.has_day} Low:#{forcast.low}#{forcast.temp_unit}"
    #if we have a day icon, display it otherwise display the night icon
    if forcast.has_day
      weather_image = create_weather_image(forcast.day)
      cell.detailTextLabel.text = forcast.day.desc
    else
      weather_image = create_weather_image(forcast.night)
      cell.detailTextLabel.text = forcast.night.desc
    end
    cell.imageView.image = weather_image
    cell
  end

  #tell the application what to do when someone clicks on a cell
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    forcast = @forcasts[indexPath.row]
    controller = UIApplication.sharedApplication.delegate.weather_show_controller
    navigationController.pushViewController(controller, animated:true)
    controller.setForcast(forcast)
  end
  
end
