//
//  ViewController.swift
//  LICustomActionSheet
//
//  Created by Vishal on 04/04/2019.
//  Copyright (c) 2019 Vishal. All rights reserved.
//

import UIKit
import LICustomActionSheet

class ViewController: UIViewController {
    var arrActionData:NSMutableArray!
    var arrEmojiData: NSMutableArray!
    var arrActionSheetType: NSMutableArray!
    var arrActionSheetTypeDetail: NSMutableArray!
    var selectedIndexPath:IndexPath!
    
    var objShowOnlineOfflinePicker :LICustomActionSheetVC!
    var objShowEmojiPicker:LICustomActionSheetVC!
    var objShowGetImageActionSheet:LICustomActionSheetVC!
    var objShowEmogi_MediaSheet:LICustomActionSheetVC!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        arrActionSheetType = ["Media with Media Picker","Gallary and Camera Picker","Online Offline Picker","Emogi Picker",]
        arrActionSheetTypeDetail = ["Actionsheet with emoji list and title with sidelogo","Actionsheet with button title with side logo","Actionsheet Title without logo","Actionsheet with only emoji",]
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Custom Actionsheet"
    }
    
    func showEmogi_MediaSheet() -> Void {
        
        arrActionData = [
            ["icon":"camera","title":"Camera"],
            ["icon":"gallary","title":"Gallary"]
        ]
        arrEmojiData = NSMutableArray.init(array: ["profile_pic1","profile_pic4","profile_pic7","profile_pic2","profile_pic5","profile_pic8","profile_pic3","profile_pic6","profile_pic9","profile_pic10"])
        objShowEmogi_MediaSheet = LICustomActionSheetVC.create()
        objShowEmogi_MediaSheet.actionButtonTextColor = UIColor.blue
        objShowEmogi_MediaSheet.cancelButtonTextColor = UIColor.red
        objShowEmogi_MediaSheet.loadActionSheet(fromView: self, arrEmoji: arrEmojiData,  arrActionData: arrActionData, type: .sectionWise)
        
    }
    
    func showGetImageActionSheet() -> Void {
        arrActionData = [
            ["icon":"","title":"Camera"],
            ["icon":"","title":"Gallary"]
        ]
        arrEmojiData = NSMutableArray.init(array: ["profile_pic1","profile_pic4","profile_pic7","profile_pic2","profile_pic5","profile_pic8","profile_pic3","profile_pic6","profile_pic9","profile_pic10"])
        
        
        let arrActionsImage = ActionSheetConstants.getArrayOfImgMediaOption()
        objShowGetImageActionSheet = LICustomActionSheetVC.create()
        objShowGetImageActionSheet.loadActionSheet(fromView: self, arrEmoji: nil,  arrActionData: arrActionData, type: .regular)
    }
    
    func showOnlineOfflinePicker() -> Void {
        arrActionData = [
            ["icon":"","title":"available"],
            ["icon":"","title":"away"],
            ["icon":"","title":"not_available"]
        ]
        
        objShowOnlineOfflinePicker = LICustomActionSheetVC.create()
        objShowOnlineOfflinePicker.cancelButtonTextColor = UIColor.red
        objShowOnlineOfflinePicker.actionButtonTextColor = UIColor.green
        objShowOnlineOfflinePicker.loadActionSheet(fromView: self, arrEmoji: nil, arrActionData: arrActionData, type: .regular)
    }
    
    func showEmojiPicker() -> Void {
        
        arrEmojiData = NSMutableArray.init(array: ["profile_pic1","profile_pic4","profile_pic7","profile_pic2","profile_pic5","profile_pic8","profile_pic3","profile_pic6","profile_pic9","profile_pic10"])
        
        objShowEmojiPicker = LICustomActionSheetVC.create()
        objShowEmojiPicker.cancelButtonTextColor = UIColor.red
        objShowEmojiPicker.actionButtonTextColor = UIColor.green
        objShowEmojiPicker.loadActionSheet(fromView: self, arrEmoji: arrEmojiData, arrActionData: nil, type: .sectionWise)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController:ConfigureActionSheet{
    func didSelectedActionView(_ objCustomAction: LICustomActionSheetVC, isEmojiSelected: Bool, index: IndexPath, selectedActionIndex:  Int) {
        print("Selected Action --> \(selectedActionIndex)")
        switch objCustomAction {
        case objShowOnlineOfflinePicker:
            print("objShowOnlineOfflinePicker => ")
            
            break;
        case objShowEmojiPicker:
            print("objShowEmojiPicker")
            
            break;
        case objShowGetImageActionSheet:
            print("objShowGetImageActionSheet")
            break;
        case objShowEmogi_MediaSheet:
            print("objShowEmogi_MediaSheet")
            break;
        default:
            print("didselected")
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrActionSheetType.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionSheetTypeTableViewCell", for: indexPath)  as! ActionSheetTypeTableViewCell
        cell.lblTitle.text = (arrActionSheetType![indexPath.row] as! String)
        cell.lblDescreption.text = (arrActionSheetTypeDetail![indexPath.row] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("Didselect")
        switch arrActionSheetType[indexPath.row] as! String {
        case "Media with Media Picker":
            self.showEmogi_MediaSheet()
            break;
        case "Gallary and Camera Picker":
            self.showGetImageActionSheet()
            break;
        case "Online Offline Picker":
            self.showOnlineOfflinePicker()
            break
        case "Emogi Picker":
            self.showEmojiPicker()
            break
        default:
            self.showEmogi_MediaSheet()
        }
    }
}
