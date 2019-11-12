//
//  FeedsViewModel.swift
//  Awards
//
//  Created by Engkit Satia Riswara on 12/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

final class FeedsViewModel {
	
	var feeds: [FeedsModel] = []
	
	init() {
		feeds = getFeeds()
	}
	
	private func getFeeds() -> [FeedsModel] {
		
		let feeds: [FeedsModel] = [
			
			FeedsModel(imageUrl: "https://cdn.shopify.com/s/files/1/1061/1924/files/Ghost_Emoji.png?8026536574188759287", points: "500.000", description: "Gift Card blah blah", feedType: .vouchers),
			FeedsModel(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlDOfLWik_4fqil93jKyMkVfZdar_84lKuf-xILt9idmtKN8_3&s", points: "200.000", description: "Gift Card sh sh", feedType: .vouchers),
			FeedsModel(imageUrl: "https://purepng.com/public/uploads/large/purepng.com-mario-basedmariosuper-mariovideo-gamefictional-characternintendoshigeru-miyamotomario-franchise-1701528638261qawv8.png", points: "110.000", description: "Product Discount 50%", feedType: .products),
			FeedsModel(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnMcwYKMx5qE1_KAM0yyjg9pjRLwT5orhDzmUK-qY6fbw9y7mf_w&s", points: "50.000", description: "Spa Voucher", feedType: .vouchers)
			
		]
		
		return feeds
	}
	
}
