class SplashViewController < UIViewController
  def viewDidLoad
    self.view = UIImageView.alloc.init
    self.view.image = UIImage.imageNamed('Splash.png')
  end
end
