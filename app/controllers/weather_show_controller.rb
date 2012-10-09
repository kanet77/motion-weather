class WeatherShowController < UIViewController

  stylesheet :weather_style

  layout :root do
    @first_description = subview(UITextView, :first_section)
    @first_description.delegate = self
    @first_description.returnKeyType = UIReturnKeyDone
    @second_description = subview(UITextView, :second_section)
    @second_description.delegate = self
    @second_description.returnKeyType = UIReturnKeyDone
  end

  def textViewShouldReturn(textView)
    textView.resignFirstResponder
    true
  end

  def textFieldShouldReturn(textfield)
    textfield.resignFirstResponder
    true
  end

  def setForcast(forcast)
    if forcast.has_day
      day_image = UIImageView.alloc.initWithImage(create_weather_image(forcast.day))
      night_image = UIImageView.alloc.initWithImage(create_weather_image(forcast.night))
      night_image.frame = [[10, 165],[50,42]]
      @first_description.text = "#{forcast.day.desc}\n#{forcast.day.pred}"
      @second_description.text = "#{forcast.night.desc}\n#{forcast.night.pred}"
      view.addSubview(day_image)
      view.addSubview(night_image)
    else
      night_image = UIImageView.alloc.initWithImage(create_weather_image(forcast.night))
      view.addSubview(night_image)
      @first_description.text = "#{forcast.night.desc}\n#{forcast.night.pred}"
    end
  end

end
