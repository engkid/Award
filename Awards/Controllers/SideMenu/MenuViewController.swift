//
//  MenuViewController.swift
//  Awards
//
//  Created by Engkit Satia Riswara on 13/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

	@IBOutlet weak var menuTableView: UITableView?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		configureTableView()
    }

	private func configureTableView() {
		menuTableView?.delegate = self
		menuTableView?.dataSource = self
		menuTableView?.separatorStyle = .none
		
		menuTableView?.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
		menuTableView?.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.setNavigationBarHidden(true, animated: true)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		self.navigationController?.setNavigationBarHidden(false, animated: true)
	}
	
}

extension MenuViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		switch section {
			
		case 0:
			return 1
		case 1:
			return 4
		default:
			return 0
		}
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		guard indexPath.section == 0 else {
			return 70
		}
		
		return 250
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let section = indexPath.section
		
		switch section {
		case 0:
			
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as? HeaderTableViewCell else {
				return UITableViewCell()
			}
		
			return cell
		case 1:
			
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else {
				return UITableViewCell()
			}
			
			cell.setup("title")
			
			return cell
		default:
			return UITableViewCell()
		}
	}
}

extension MenuViewController: UITableViewDelegate {
	
}
