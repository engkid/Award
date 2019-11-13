//
//  FeedsCollectionViewCell.swift
//  Awards
//
//  Created by Engkit Satia Riswara on 12/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit
import SDWebImage

class FeedsCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var feedsImage: UIImageView?
	@IBOutlet weak var pointLabel: UILabel?
	@IBOutlet weak var descriptionLabel: UILabel?
	@IBOutlet weak var feedsButton: UIButton?
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		setupViews()
    }
	
	private func setupViews() {
		feedsButton?.layer.cornerRadius = 5
		feedsButton?.setTitleColor(UIColor.white, for: .normal)
	}
	
	func setContents(_ model: FeedsModel) {
		
		pointLabel?.text = model.points
		descriptionLabel?.text = model.description
		feedsImage?.sd_setImage(with: URL(string: model.imageUrl), completed: nil)
		
		switch model.feedType {
		case .vouchers:
			
			feedsButton?.setTitle("Vouchers", for: .normal)
			feedsButton?.backgroundColor = .blue
			
		case .products:
			
			feedsButton?.setTitle("Products", for: .normal)
			feedsButton?.backgroundColor = .orange
			
		case .giftcard:
			
			feedsButton?.setTitle("Giftcard", for: .normal)
			feedsButton?.backgroundColor = .green
		}
		
	}
	
}
