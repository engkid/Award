//
//  HeaderTableViewCell.swift
//  Awards
//
//  Created by Engkit Satia Riswara on 13/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

	@IBOutlet weak var headerImage: UIImageView?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		headerImage?.image = UIImage(named: "star")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
