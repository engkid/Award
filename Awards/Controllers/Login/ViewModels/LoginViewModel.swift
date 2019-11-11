//
//  LoginViewModel.swift
//  Awards
//
//  Created by Engkit Satia Riswara on 11/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation

final class LoginViewModel {
	
	init() {}
	
	func performLogin(with email: String, completion: @escaping (_ success: Bool) -> Void) {
		
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
			
			if email == "engkidsr@gmail.com" {
				completion(true)
			} else {
				completion(false)
			}
			
		})
	}
}
