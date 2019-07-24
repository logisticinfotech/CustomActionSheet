# LICustomActionSheet
==================================

LICustomActionSheet provide the simple way to use different type of actionsheet.

[![CI Status](https://img.shields.io/travis/vvdodiya/LICustomActionSheet.svg?style=flat)](https://travis-ci.org/vvdodiya/LICustomActionSheet)
[![Version](https://img.shields.io/cocoapods/v/LICustomActionSheet.svg?style=flat)](https://cocoapods.org/pods/LICustomActionSheet)
[![License](https://img.shields.io/cocoapods/l/LICustomActionSheet.svg?style=flat)](https://cocoapods.org/pods/LICustomActionSheet)
[![Platform](https://img.shields.io/cocoapods/p/LICustomActionSheet.svg?style=flat)](https://cocoapods.org/pods/LICustomActionSheet)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

LICustomActionSheet is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LICustomActionSheet'
```

## How to use

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

## Author

### Vishal Dodiya 
@Logistic Infotech Pvt Ltd.

## License

LICustomActionSheet is available under the MIT license. See the LICENSE file for more info.
