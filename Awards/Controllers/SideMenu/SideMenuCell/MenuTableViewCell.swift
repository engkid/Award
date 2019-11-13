//
//  MenuTableViewCell.swift
//  Awards
//
//  Created by Engkit Satia Riswara on 13/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

	@IBOutlet weak var titleLabel: UILabel?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	func setup(_ title: String) {
		titleLabel?.text = title
	}
	
}
