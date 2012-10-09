class AppDelegate
  $API_KEY = "wz63vhejzxgdtxz66xbw7wbr"
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(splash_view_controller)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end

  def splash_view_controller
    @splash_view_controller ||= SplashViewController.alloc.init
  end

  def weather_show_controller
    @weather_show_controller ||= WeatherShowController.alloc.init
  end

  def weather_list_controller
    @weather_list_controller ||= WeatherListController.alloc.init
  end
end
