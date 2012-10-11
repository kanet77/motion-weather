class SplashViewController < UIViewController
  def viewDidLoad
    self.view = UIImageView.alloc.init
    self.view.image = UIImage.imageNamed('Splash.png')
  end

  def viewWillAppear(animated)
    @alert_view = UIAlertView.alloc.initWithTitle("Enter Zipcode",
      message:"Please Enter your zipcode",
      delegate: self,
      cancelButtonTitle: "Submit",
      otherButtonTitles:nil)
    @alert_view.alertViewStyle = UIAlertViewStylePlainTextInput
    @alert_view.show
  end

  def alertView(alertView, didDismissWithButtonIndex:index)
    request_url = "http://i.wxbug.net/REST/Direct/GetForecast.ashx?zip=#{alertView.textField.text}&nf=7&ht=t&ht=i&l=en&c=US&api_key=#{$API_KEY}"
    location_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{alertView.textField.text}&sensor=true"
    BW::HTTP.get(request_url) do |response|
      controller = UIApplication.sharedApplication.delegate.weather_list_controller
      forecasts = create_hour_array(BW::JSON.parse(response.body.to_str)["forecastList"])
      controller.display_weather(forecasts)
      controller.display_location(location_url)
      navigationController.pushViewController(controller, animated:true)
    end
  end

  def create_hour_array(forecasts)
    return forecasts.map {|forecast| forecast.new(forecast)}
  end
end
