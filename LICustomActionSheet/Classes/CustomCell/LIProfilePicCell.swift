//
//  LIProfilePicCell.swift
//  LICustomActionSheet
//
//  Created by Vishal on 04/04/19.
//  Copyright © 2019 Logistic Infotech Pvt Ltd. All rights reserved.
//

import UIKit

class LIProfilePicCell: UICollectionViewCell {
    
    @IBOutlet weak var imgViewProfilePic: UIImageView!
    @IBOutlet weak var imgViewSelectedProfile: UIImageView!
    @IBOutlet weak var viewSelectedProfile: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewSelectedProfile.layer.cornerRadius = viewSelectedProfile.frame.width/2
        viewSelectedProfile.layer.masksToBounds = true
        imgViewProfilePic.layer.cornerRadius = imgViewProfilePic.frame.width/2
        if UIScreen.main.bounds.height == 568 {
            viewSelectedProfile.layer.cornerRadius = viewSelectedProfile.frame.size.width/2.4
            imgViewProfilePic.layer.cornerRadius = imgViewProfilePic.frame.size.width/2.4
        }
        
    }
}
