//
//  Constants.swift
//  Connect
//
//  Created by Vishal 23/06/17.
//  Copyright © 2017 Logistic Infotech Pvt Ltd. All rights reserved.
//

import Foundation
import UIKit


/// Common Constants
let appDelegate = UIApplication.shared.delegate as! AppDelegate
// Media Path

public struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

public struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
}

public struct Platform {
    static var isSimulator:Bool {
        return TARGET_OS_SIMULATOR != 0
    }
}


/////////////////////////////////////////////
////////// // Action Sheet Constants Struct //////////
/////////////////////////////////////////////

struct ActionSheetConstants
{
    /// Contact Screen Action Sheet Constants
    static let CreateNewContact = "Create New Contact"
    static let InviteContact = "Invite Contact"
    
    /// Chat List Screen Action Sheet Constants
    
    static let Available = "Online"//"Available"
    static let Away = "Busy"//"Away"
    static let NotAvailable = "Offline" //"Not Available"
    
    /// User Profile Screen Action Sheet Constants
    
    static let Camera = "Camera"
    static let Gallery = "Gallery"
        
    static func getArrayOfStrAddOrInviteContact() -> NSMutableArray {
        return NSMutableArray.init(array: [CreateNewContact,InviteContact])
    }
    
    static func getArrayOfImgAddOrInviteContact() -> NSMutableArray {
        return NSMutableArray.init(array: ["new_contact","invite_contact"])
    }
    
    static func getArrayOfStrUserStatus() -> NSMutableArray {
        return NSMutableArray.init(array: [Available,Away,NotAvailable])
    }
    
    static func getArrayOfImgUserStatus() -> NSMutableArray {
        return NSMutableArray.init(array: ["available","away","not_available"])
    }
    
    static func getArrayOfStrMediaOption() -> NSMutableArray {
        return NSMutableArray.init(array: [Camera,Gallery])
    }
    
    static func getArrayOfImgMediaOption() -> NSMutableArray {
        return NSMutableArray.init(array: ["camera","gallery"])
    }
    static func getArrayOfStrTellFrindOption() -> NSMutableArray {
        return NSMutableArray.init(array: ["Mail","Message","More",])
    }
    static func getArrayOfImgTellFriendOption() -> NSMutableArray {
        return NSMutableArray.init(array: ["Mail","Message","More"])
    }
    static func getArrayOfErrorMessage() -> NSMutableArray {
        return NSMutableArray.init(array: ["Send Message"])
    }
    static func getArrayOfImgErrorMessage() -> NSMutableArray {
        return NSMutableArray.init(array: ["Send Message"])
    }
    static func getArrayOfStrMuteGroupOption() -> NSMutableArray {
        return NSMutableArray.init(array: ["8 Hour","1 Week","1 Year"])
    }
    static func getArrayOfImgMuteGroupOption() -> NSMutableArray {
        return NSMutableArray.init(array: ["8 Hour","1 Week","1 Year"])
    }
}
