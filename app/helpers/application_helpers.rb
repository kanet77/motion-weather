#Use some Objective-C libraries to create the image from the url
def create_weather_image(forecast)
  url = NSURL.URLWithString("http://img.weather.weatherbug.com/forecast/icons/localized/50x42/en/trans/#{forecast.icon}.png")
  image = UIImage.imageWithData(NSData.dataWithContentsOfURL(url))
end
