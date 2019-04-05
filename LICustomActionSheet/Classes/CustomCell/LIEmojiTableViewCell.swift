//
//  LIEmojiTableViewCell.swift
//  LICustomActionSheet
//
//  Created by Vishal on 04/04/19.
//  Copyright © 2019 Logistic Infotech Pvt Ltd. All rights reserved.
//

import UIKit

class LIEmojiTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var constEmojiCellLeft: NSLayoutConstraint!
    @IBOutlet weak var constEmojiCellTop: NSLayoutConstraint!
    @IBOutlet weak var constEmojiCellBottom: NSLayoutConstraint!
    @IBOutlet weak var constEmojiCellRight: NSLayoutConstraint!
    @IBOutlet weak var viewEmoji: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!

    var actionSheetType :ActionSheetType!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    override func draw(_ rect: CGRect) {
        if(actionSheetType == ActionSheetType.sectionWise){
            viewEmoji.layer.masksToBounds = true
            viewEmoji.layer.cornerRadius = 8            
            
            self.constEmojiCellTop.constant = 8.0
            self.constEmojiCellLeft.constant = 8.0
            self.constEmojiCellRight.constant = 8.0
            self.constEmojiCellBottom.constant = 8.0
            
        }else{
            self.constEmojiCellTop.constant = 0.0
            self.constEmojiCellLeft.constant = 0.0
            self.constEmojiCellRight.constant = 0.0
            self.constEmojiCellBottom.constant = 0.0
        }

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
