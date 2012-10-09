#Use some Objective-C libraries to create the image from the url
def create_weather_image(forcast)
  url = NSURL.URLWithString("http://img.weather.weatherbug.com/forecast/icons/localized/50x42/en/trans/#{forcast.icon}.png")
  image = UIImage.imageWithData(NSData.dataWithContentsOfURL(url))
end
