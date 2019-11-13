//
//  FilterViewController.swift
//  Awards
//
//  Created by Engkit Satia Riswara on 13/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

	@IBOutlet weak var closeButton: UIButton?
	@IBOutlet weak var horizontalSlider: UISlider?
	@IBOutlet weak var minPointLabel: UILabel?
	@IBOutlet weak var maxPointLabel: UILabel?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
    }
	
	private func setupView() {
		
		closeButton?.setImage(UIImage(named: "close"), for: .normal)
		
		closeButton?.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
	}

	@objc private func closeTapped() {
		self.dismiss(animated: true, completion: nil)
	}

	
	@IBAction func sliderValueChanged(_ sender: Any) {
		
		maxPointLabel?.text = "IDR \(self.horizontalSlider?.value ?? 10000.0)"
	}
	
}
