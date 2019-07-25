#
# Be sure to run `pod lib lint LICustomActionSheet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LICustomActionSheet'
  s.version          = '0.1.3'
  s.summary          = 'LICustomActionSheet provide the simple way to use different type of actionsheet.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  TODO:
  
  1. Import LICustomActionSheet in your class to use LICustomActionsheet:
  
  import LICustomActionSheet
  
  2. Create object of LICustomActionSheet using create() method like below:
  
  var objCustomActionSheet = LICustomActionSheetVC.create()
  
  3. To present simplay Call loadActionSheet() using object of LICustomActionSheet:
  
  objShowGetImageActionSheet.loadActionSheet(fromView: self, arrEmoji: nil, arrActionData: arrActionData, type: .regular)
  
  Here,
  
  - fromView : fromView is the object of your object of your class to handle delegate method of  LIActionsheet. This parameter is Required.
  
  - arrEmoji: If you want to display Emoji actionsheet than you need to pass array of emoji name and need to add images in the your project.
  
  - arrActionData: arrActionData is array of action name which you want to display in the action sheet.
  
  - type: you can set type of actionsheet. e.g. regular and sectionWise
  
  ## Customization
  
  ### Colors
  
  `actionButtonTextColor` - standard color for LICustomActionSheet's buttons
  
  `cancelButtonTextColor` - color for the cancel button.
  
  ## Example
  
  ## Author
  
  ### Vishal Dodiya
  @Logistic Infotech Pvt Ltd.

                       DESC

  s.homepage         = 'https://github.com/logisticinfotech/CustomActionSheet'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vvdodiya' => 'v.v.dodiya101@gmail.com' }
  s.source           = { :git => 'https://github.com/logisticinfotech/CustomActionSheet.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'LICustomActionSheet/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LICustomActionSheet' => ['LICustomActionSheet/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
