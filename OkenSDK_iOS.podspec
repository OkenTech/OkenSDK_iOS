#
# Be sure to run `pod lib lint OkenLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OkenSDK'
  s.version          = '0.1.0'
  s.summary          = 'Analyse your reading. Get great results.'

  s.description      = 'We use Machine Learning to accurately predict your reading states based on captured eye movements. This allows Oken to detect your focus, engagement and comprehension levels with no external devices required.'

  s.homepage         = 'https://oken.tech'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'David Dreval' => 'david@oken.tech' }
  s.source           = { :git => 'https://github.com/OkenDev/OkenSDK_iOS.git' }
  s.documentation_url = 'https://github.com/OkenDev/OkenSDK_iOS/tree/main/OkenSDK.doccarchive'
  
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

   s.vendored_frameworks = 'OkenSDK.framework'
   s.dependency 'Starscream', '~> 4.0.0'
   s.dependency 'Alamofire'
   s.dependency 'Zip'
end
