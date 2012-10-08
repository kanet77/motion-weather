class SplashViewController < UIViewController
  def viewDidLoad
    self.view = UIImageView.alloc.init
    self.view.image = UIImage.imageNamed('Splash.png')
    @alert_view = UIAlertView.alloc.initWithTitle("Enter Zipcode",
      message:"Please Enter your zipcode",
      delegate: self,
      cancelButtonTitle: "Submit",
      otherButtonTitles:nil)
    @alert_view.alertViewStyle = UIAlertViewStylePlainTextInput
    @alert_view.show
  end

  def alertView(alertView, didDismissWithButtonIndex:index)
    puts alertView.textField.text
  end
end
