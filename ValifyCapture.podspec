#
# Be sure to run `pod lib lint ValifyCapture.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ValifyCapture'
  s.version          = '1.0.0'
  s.summary          = 'A lightweight framework that enables seamless selfie capture and approval workflows.'


  s.description      = "ValifyCapture is a modular and lightweight iOS framework that simplifies the process of capturing and approving selfies as part of a digital onboarding or verification flow. Built using AVFoundation, the framework provides a customizable camera interface for capturing selfies, followed by an approval screen where users can either confirm or retake their photo. Upon approval, the captured image is sent back to the host app via a delegate. Ideal for financial institutions, e-commerce platforms, or any app requiring user verification, SelfieCaptureKit ensures a seamless, intuitive user experience while being easy to integrate into any existing application."

  s.homepage         = 'https://github.com/iOSayedAhmed/ValifyCapturee'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ElsayedAhmed' => 'elsayed1ahmed0@gmail.com' }
  s.source           = { :git => 'https://github.com/iOSayedAhmed/ValifyCapturee.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'ValifyCapture/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ValifyCapture' => ['ValifyCapture/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
