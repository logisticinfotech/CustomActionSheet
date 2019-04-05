//
//  LICancelButtonCell.swift
//  LICustomActionSheet
//
//  Created by Vishal on 04/04/19.
//  Copyright © 2019 Logistic Infotech Pvt Ltd. All rights reserved.
//

import UIKit

@objc protocol DismissViewDelegate {
    @objc optional func onClickDismiss()
}


class LICancelButtonCell: UITableViewCell {
    
    @IBOutlet weak var constCancelCellLeft: NSLayoutConstraint!
    @IBOutlet weak var constCancelCellTop: NSLayoutConstraint!
    @IBOutlet weak var constCancelCellRight: NSLayoutConstraint!
    @IBOutlet weak var constCancelCellBottom: NSLayoutConstraint!
    
    @IBOutlet weak var btnCancel: UIButton!
    
    var actionSheetType :ActionSheetType!
    var delegate:DismissViewDelegate!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func draw(_ rect: CGRect) {
        
        if(actionSheetType == ActionSheetType.sectionWise){
            btnCancel.layer.masksToBounds = true
            btnCancel.layer.cornerRadius = 8
            self.constCancelCellTop.constant = 8.0
            self.constCancelCellLeft.constant = 8.0
            self.constCancelCellRight.constant = 8.0
            self.constCancelCellBottom.constant = 8.0
            
        }else{
            self.constCancelCellTop.constant = 0.0
            self.constCancelCellLeft.constant = 0.0
            self.constCancelCellRight.constant = 0.0
            self.constCancelCellBottom.constant = 0.0
        }
    }
    
    @IBAction func onClickCancel(_ sender: Any) {
        self.delegate?.onClickDismiss!()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
