//
//  FeedsModel.swift
//  Awards
//
//  Created by Engkit Satia Riswara on 12/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

enum FeedType {
	case vouchers
	case products
	case giftcard
}

struct FeedsModel {
	
	let imageUrl: String
	let points: String
	let description: String
	let feedType: FeedType
	
}
