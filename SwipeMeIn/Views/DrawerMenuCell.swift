//
//  DrawerMenuCellTableViewCell.swift
//  SwipeMeIn
//
//  Created by Jacob Hausmann on 7/11/19.
//  Copyright © 2019 Jacob Hausmann. All rights reserved.
//

import UIKit

class DrawerMenuCell: UITableViewCell {

    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
