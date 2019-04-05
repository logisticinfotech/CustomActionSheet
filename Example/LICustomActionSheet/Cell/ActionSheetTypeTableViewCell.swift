//
//  ActionSheetTypeTableViewCell.swift
//  CustomActionSheet
//
//  Created by Vishal on 28/03/19.
//  Copyright © 2019 Vishal. All rights reserved.
//

import UIKit

class ActionSheetTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDescreption: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
