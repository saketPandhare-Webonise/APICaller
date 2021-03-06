#
# Be sure to run `pod lib lint APICaller.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'APICaller'
  s.version          = '0.4.0'
  s.summary          = 'API Handler FOr Swift Using Alamofire'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Use this to call APIs in Swift using alamofire'

  s.homepage         = 'https://github.com/saketPandhare-Webonise/APICaller'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'saketPandhare-Webonise' => 'saket.pandhare@weboniselab.com' }
  s.source           = { :git => 'https://github.com/saketPandhare-Webonise/APICaller.git', :tag => s.version}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'APICaller/Classes/**/*'
  
  # s.resource_bundles = {
  #   'APICaller' => ['APICaller/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire'
end
