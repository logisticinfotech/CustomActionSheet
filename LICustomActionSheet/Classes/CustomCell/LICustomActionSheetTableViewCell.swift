//
//  LICustomActionSheetTableViewCell.swift
//  LICustomActionSheet
//
//  Created by Vishal on 04/04/19.
//  Copyright © 2019 Logistic Infotech Pvt Ltd. All rights reserved.
//

import UIKit

class LICustomActionSheetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var constActionCellRight: NSLayoutConstraint!
    @IBOutlet weak var constActionCellLeft: NSLayoutConstraint!
    @IBOutlet weak var viewCustomActionSheet: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblActionName: UILabel!
    @IBOutlet weak var viewSeparator: UIView!
    
    var actionSheetType :ActionSheetType!
    
    var isRoundCell:String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        
        if(actionSheetType == ActionSheetType.sectionWise){
            self.constActionCellLeft.constant = 8.0
            self.constActionCellRight.constant = 8.0
            
            switch isRoundCell {
                
            case "1":
                viewSeparator.isHidden = false
                viewCustomActionSheet.roundCorners(corners: [.topRight,.topLeft], radius: 8)
                break
            case "2":
                viewSeparator.isHidden = true
                viewCustomActionSheet.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 8)
                break
            case "4":
                viewSeparator.isHidden = true
                viewCustomActionSheet.layer.cornerRadius = 8
                break
            default:
                break
            }
        }
        else{
            self.constActionCellLeft.constant = 0.0
            self.constActionCellRight.constant = 0.0
            viewSeparator.isHidden = true
        }   
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension UIView {
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func setShadow(color:UIColor) {
        self.layer.cornerRadius = 8
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = (color == UIColor.black) ? 0.2 : 0.5
        self.layer.masksToBounds = false
    }
    
    func setBtnViewShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowPath = UIBezierPath(rect: CGRect.init(x: 4, y: 0, width: self.frame.width-24, height: self.frame.height)).cgPath
        self.layer.shadowOffset = CGSize(width: 8, height: 4)
        self.layer.shadowOpacity = 0.1
    }
    func setBottomShadow(color: UIColor) {
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: 0, y: self.bounds.height))
        shadowPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
        shadowPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height + 4))
        shadowPath.addLine(to: CGPoint(x: 0, y: self.bounds.height + 4))
        shadowPath.close()
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.shadowRadius = 4
    }
    func showActivityIndicator() {
        let activityView = UIActivityIndicatorView(style: .gray)
        activityView.center = self.center
        activityView.startAnimating()
        
        self.addSubview(activityView)
    }
}
