//
//  LICustomActionSheetVC.swift
//  LICustomActionSheet
//
//  Created by Vishal on 04/04/19.
//  Copyright © 2019 Logistic Infotech Pvt Ltd. All rights reserved.
//

import UIKit

public enum ActionSheetType: Int {
    case regular, sectionWise
    
    public func description() -> String {
        switch self {
        case .regular:
            return "regular"
        case .sectionWise:
            return "sectionWise"
        }
    }
}
@objc public protocol ConfigureActionSheet {
    @objc optional func didSelectedActionView(_ objCustomAction : LICustomActionSheetVC, isEmojiSelected:Bool ,index:IndexPath, selectedActionIndex:Int)
}

public class LICustomActionSheetVC: UIViewController,UIGestureRecognizerDelegate {
    
    //MARK: - Class Variables
    //MARK: -
    
    var arrProfilePicture:NSMutableArray!
    var arrEmoji:NSMutableArray? = NSMutableArray()
    var arrOtherAction:NSMutableArray!
    
    public var actionSheetType:ActionSheetType!
    var delegate:ConfigureActionSheet!
    public var selected_indexPath:IndexPath?
    public var cancelButtonTextColor:UIColor?
    public var actionButtonTextColor:UIColor?
    
    @IBOutlet weak var tblActionSheet: UITableView!
    
    @IBOutlet weak var consTblActionSheetHeight: NSLayoutConstraint!
    
    var isForProfile:Bool = false
    
    var selected_indexPath2:IndexPath?
    
    var containerView:UIView?
    
    var containerViewYPos:Int = 0
    
    //MARK: - IBOutlets
    //MARK: -
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var constTblActionSheetBottomSpace: NSLayoutConstraint!
    
    
    public static func create() -> LICustomActionSheetVC
    {
        let podBundle = Bundle(for: LICustomActionSheetVC.self)
        
        return UIStoryboard(name: "LICustomActionSheetSB", bundle: podBundle).instantiateViewController(withIdentifier: "LICustomActionSheetVC") as! LICustomActionSheetVC

//        return UIStoryboard(name: "LICustomActionSheetSB", bundle: nil).instantiateViewController(withIdentifier: "LICustomActionSheetVC") as! LICustomActionSheetVC
    }
    
    
    //MARK: - ViewController Life Cycle
    //MARK: -
    
    public func loadActionSheet(fromView:UIViewController!, arrEmoji:NSMutableArray?, arrActionData:NSMutableArray?,type:ActionSheetType){

        self.actionSheetType = type
        self.arrOtherAction = arrActionData
        self.arrEmoji = arrEmoji
        self.delegate = (fromView as! ConfigureActionSheet)
        self.modalPresentationStyle = .overCurrentContext
        
        fromView.present(self, animated: false, completion: nil)
    }
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if(cancelButtonTextColor == nil){
            cancelButtonTextColor = UIColor.gray
        }
        if(actionButtonTextColor ==  nil)
        {
            actionButtonTextColor = UIColor.init(red: 234/255, green: 38/255, blue: 132/255, alpha: 1)
        }
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.settingAppearance()
        viewBackground.isHidden = false
        Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(showMenu), userInfo: nil, repeats: false)
        
        
    }
    public override func viewWillDisappear(_ animated: Bool) {
        
    }
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        
    }
    
    func animateBackgroundView(isVisible:Bool){
        if isVisible{
            viewBackground.alpha = 0.0
            UIView.animate(withDuration: 0.0, delay: 0.0, options: .curveEaseInOut, animations: {
                self.viewBackground.alpha = 1.0
            }, completion: nil)
        }else{
            viewBackground.alpha = 1.0
            UIView.animate(withDuration: 0.0, delay: 0.0, options: .curveEaseInOut, animations: {
                self.viewBackground.alpha = 0.0
            }, completion: nil)
        }
    }
    
    /// Setting appearance
    func settingAppearance()  {
        self.tblActionSheet.separatorStyle = .none
        tblActionSheet.estimatedRowHeight = 60
        tblActionSheet.rowHeight =  UITableView.automaticDimension
    }
    
    
    /// Show menu with animation
    @objc func showMenu() {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.transitionCurlUp],
                       animations: {
                        self.constTblActionSheetBottomSpace.constant = 0
                        
                        self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    //    Gesture Delegate
    private func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: tblActionSheet))! {
            return false
        }
        return true
    }
    
    //    Action Method
    @IBAction func tappedOutside(_ sender: Any) {
        self.animateBackgroundView(isVisible: false)
        UIView.animate(withDuration: 0.3, animations: {
            self.tblActionSheet.frame = CGRect(x: self.tblActionSheet.frame.origin.x, y: UIScreen.main.bounds.height , width: self.tblActionSheet.frame.width, height: self.tblActionSheet.frame.height)
            self.constTblActionSheetBottomSpace.constant = -self.consTblActionSheetHeight.constant
        }) { (success) in
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension LICustomActionSheetVC:DismissViewDelegate{
    func onClickDismiss() {
        self.animateBackgroundView(isVisible: false)
        UIView.animate(withDuration: 0.3, animations: {
            self.tblActionSheet.frame = CGRect(x: self.tblActionSheet.frame.origin.x, y: UIScreen.main.bounds.height , width: self.tblActionSheet.frame.width, height: self.tblActionSheet.frame.height)
            self.constTblActionSheetBottomSpace.constant = -self.consTblActionSheetHeight.constant
        }) { (success) in
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension LICustomActionSheetVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let profilePicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LIProfilePicCell", for: indexPath)
            as! LIProfilePicCell
        profilePicCell.imgViewProfilePic.image = UIImage.init(named: "\(arrEmoji?.object(at: indexPath.row) as! String)")
        if DeviceType.IS_IPHONE_6P{
            profilePicCell.viewSelectedProfile.layer.cornerRadius = (profilePicCell.imgViewProfilePic.image?.size.width)!/1.8
        }   
        if selected_indexPath != nil {
            if selected_indexPath == indexPath {
                profilePicCell.imgViewSelectedProfile.isHidden = false
                profilePicCell.viewSelectedProfile.isHidden = false
            }
            else {
                profilePicCell.imgViewSelectedProfile.isHidden = true
                profilePicCell.viewSelectedProfile.isHidden = true
            }
        }
        else {
            profilePicCell.imgViewSelectedProfile.isHidden = true
            profilePicCell.viewSelectedProfile.isHidden = true
        }
        
        //        configureCell(cell: profilePicCell, forItemAt: indexPath)
        
        return profilePicCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (arrEmoji?.count)!
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 16), height: CGFloat((collectionView.frame.size.width / 3) - 16))
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0;
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13.0;
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 13.0, left: 13.0, bottom: 13.0, right: 13.0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.animateBackgroundView(isVisible: false)
        UIView.animate(withDuration: 0.3, animations: {
            self.tblActionSheet.frame = CGRect(x: self.tblActionSheet.frame.origin.x, y: UIScreen.main.bounds.height , width: self.tblActionSheet.frame.width, height: self.tblActionSheet.frame.height)
            self.constTblActionSheetBottomSpace.constant = -self.consTblActionSheetHeight.constant
        }) { (success) in
            self.dismiss(animated: false, completion: {
                self.selected_indexPath = indexPath
                self.tblActionSheet.reloadData()
                
                if (self.delegate != nil)
                {
                    self.delegate.didSelectedActionView?(self, isEmojiSelected: true, index: indexPath, selectedActionIndex: indexPath.row)
                }
                
            })
        }
    }
}

extension LICustomActionSheetVC:UITableViewDelegate,UITableViewDataSource
{
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if arrEmoji != nil
        {
            if arrOtherAction != nil
            {
                return arrOtherAction.count + 2
            }
            else
            {
                return 2
            }
        }
        else
        {
            if arrOtherAction != nil
            {
                return arrOtherAction.count + 1
            }
            else
            {
                return 1
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if tableView.contentSize.height > self.view.frame.height
        {
            tblActionSheet.isScrollEnabled = true
        }
        else
        {
            tblActionSheet.isScrollEnabled = false
        }
        let maxHeight = tableView.contentSize.height > viewBackground.frame.height ? viewBackground.frame.height : tableView.contentSize.height
        consTblActionSheetHeight.constant = maxHeight
        self.view.layoutIfNeeded()
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if arrEmoji != nil
        {
            if indexPath.row == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LIEmojiTableViewCell", for: indexPath) as! LIEmojiTableViewCell
                cell.actionSheetType = self.actionSheetType
                cell.selectionStyle = .none
                return cell
            }
            else
            {
                if arrOtherAction != nil
                {
                    if indexPath.row == arrOtherAction.count + 1
                    {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "LICancelButtonCell", for: indexPath) as! LICancelButtonCell
                        cell.actionSheetType = self.actionSheetType
                        cell.btnCancel.setTitleColor(cancelButtonTextColor, for: .normal)
                        cell.delegate = self
                        cell.selectionStyle = .none
                        return cell
                    }
                    else
                    {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "LICustomActionSheetTableViewCell", for: indexPath) as! LICustomActionSheetTableViewCell
                        cell.actionSheetType = self.actionSheetType
                        cell.lblActionName.textColor = actionButtonTextColor
                        cell.selectionStyle = .none
                        if indexPath.row == 1
                        {
                            cell.isRoundCell = "1"
                        }
                        else if indexPath.row == arrOtherAction.count
                        {
                            cell.isRoundCell = "2"
                        }
                        else{
                            cell.isRoundCell = "3"
                        }
                        
                        
                        if(((((self.arrOtherAction[indexPath.row - 1] as! NSDictionary).value(forKey: "icon"))) != nil) && (((self.arrOtherAction[indexPath.row - 1] as! NSDictionary).value(forKey: "icon")) as? String) != nil ){
                            cell.imgLogo.isHidden = false
                            cell.imgLogo.image = UIImage(named: (((self.arrOtherAction[indexPath.row - 1] as! NSDictionary).value(forKey: "icon")) as! String))
                            
                        }else{
                            cell.imgLogo.isHidden = true
                        }
                        cell.lblActionName.text = (((self.arrOtherAction[indexPath.row - 1] as! NSDictionary).value(forKey: "title")) as! String)
                        
                        return cell
                        
                    }
                }
                else
                {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "LICancelButtonCell", for: indexPath) as! LICancelButtonCell
                    cell.actionSheetType = self.actionSheetType
                    cell.btnCancel.setTitleColor(cancelButtonTextColor, for: .normal)
                    cell.selectionStyle = .none
                    cell.delegate = self
                    return cell
                }
            }
        }
        else
        {
            if arrOtherAction != nil
            {
                if indexPath.row == arrOtherAction.count
                {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "LICancelButtonCell", for: indexPath) as! LICancelButtonCell
                    cell.actionSheetType = self.actionSheetType
                    cell.btnCancel.setTitleColor(cancelButtonTextColor, for: .normal)
                    cell.selectionStyle = .none
                    cell.delegate = self
                    return cell
                }
                else
                {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "LICustomActionSheetTableViewCell", for: indexPath) as! LICustomActionSheetTableViewCell
                    cell.actionSheetType = self.actionSheetType
                    cell.selectionStyle = .none
                    cell.lblActionName.textColor = actionButtonTextColor
                    if indexPath.row == 0 && arrOtherAction.count == 1{
                        cell.isRoundCell = "4"
                    }else if indexPath.row == 0
                    {
                        cell.isRoundCell = "1"
                    }
                    else if indexPath.row == arrOtherAction.count-1
                    {
                        cell.isRoundCell = "2"
                    }
                    else
                    {
                        cell.isRoundCell = "3"
                    }
                    if(((((self.arrOtherAction[indexPath.row ] as! NSDictionary).value(forKey: "icon"))) != nil) && (((self.arrOtherAction[indexPath.row ] as! NSDictionary).value(forKey: "icon")) as? String) != nil ){
                        cell.imgLogo.isHidden = false
                        cell.imgLogo.image = UIImage(named: (((self.arrOtherAction[indexPath.row] as! NSDictionary).value(forKey: "icon")) as! String))
                        
                    }else{
                        cell.imgLogo.isHidden = true
                    }
                    cell.lblActionName.text = (((self.arrOtherAction[indexPath.row ] as! NSDictionary).value(forKey: "title")) as! String)
                    
                  
                    return cell
                }
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "LICancelButtonCell", for: indexPath) as! LICancelButtonCell
                cell.actionSheetType = self.actionSheetType
                cell.btnCancel.setTitleColor(cancelButtonTextColor, for: .normal)
                cell.selectionStyle = .none
                cell.delegate = self
                return cell
                
            }
        }
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if arrEmoji != nil
        {
            if indexPath.row == 0
            {
                return view.frame.size.width
                
            }
            else
            {
                if arrOtherAction != nil
                {
                    if indexPath.row == arrOtherAction.count + 1
                    {
                        return 76
                    }
                    else
                    {
                        return 60
                    }
                }
                else
                {
                    return 76
                }
            }
            
        }
        else
        {
            if arrOtherAction != nil
            {
                
                if indexPath.row == arrOtherAction.count
                {
                    return 76
                }
                else
                {
                    return 60
                }
            }
            else
            {
                return 76
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let totalRow = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row != totalRow - 1{
            self.animateBackgroundView(isVisible: false)
            UIView.animate(withDuration: 0.3, animations: {
                self.tblActionSheet.frame = CGRect(x: self.tblActionSheet.frame.origin.x, y: UIScreen.main.bounds.height , width: self.tblActionSheet.frame.width, height: self.tblActionSheet.frame.height)
                self.constTblActionSheetBottomSpace.constant = -self.consTblActionSheetHeight.constant
            }) { (success) in
                self.dismiss(animated: false, completion: {
                    if (self.delegate != nil)
                    {
                        self.delegate.didSelectedActionView?(self, isEmojiSelected: false, index: indexPath, selectedActionIndex: indexPath.row )
                    }
                })
            }
        }
    }
}
