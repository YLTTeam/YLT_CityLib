

Pod::Spec.new do |s|
  s.name             = 'YLT_CityLib'
  s.version          = '0.1.0'
  s.summary          = 'A short description of YLT_CityLib.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/YLTTeam/YLT_CityLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xphaijj' => 'xphaijj0305@126.com' }
  s.source           = { :git => 'https://github.com/YLTTeam/YLT_CityLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'YLT_CityLib/Classes/**/*'
  
  s.resource_bundles = {
    'YLT_CityLib' => ['YLT_CityLib/Assets/*.json']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'ReactiveObjC'
  s.dependency 'Masonry'
  s.dependency 'YLT_BaseLib'
  s.dependency 'YLT_Kit'
end
