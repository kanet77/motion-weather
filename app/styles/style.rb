Teacup::Stylesheet.new :weather_style do

  style :root,
    backgroundColor: UIColor.whiteColor,
    landscape: false

  style :section,
    height: 100,
    width: (UIScreen.mainScreen.bounds.size.width-20),
    left:10,
    top: 42,
    textColor: UIColor.blackColor

  style :first_section, extends: :section

  style :second_section, extends: :section,
    top: 210
end
