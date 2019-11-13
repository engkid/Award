//
//  FeedsViewController.swift
//  Awards
//
//  Created by Engkit Satia Riswara on 12/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit
import SideMenu

class FeedsViewController: UIViewController {

	@IBOutlet weak var feedsCollectionView: UICollectionView?
	
	private var viewModel: FeedsViewModel?
	
	private let blurEffectView: UIVisualEffectView = {
		let blurEffect: UIBlurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		return blurEffectView
	}()
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: "FeedsViewController", bundle: nil)
	}
	
	convenience init(viewModel: FeedsViewModel) {
		self.init()
		self.viewModel = viewModel
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

		title = "Awards"
		blurEffectView.frame = view.bounds
		view.addSubview(blurEffectView)
		setupCollectionView()
		setupView()
    }
	
	private func setupView() {
		
		blurEffectView.isHidden = true
		
		navigationItem.hidesBackButton = true
		
		let profileButton = UIButton()
		profileButton.setImage(UIImage(named: "menu"), for: .normal)
		profileButton.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
		
		let filterButton = UIButton()
		filterButton.setImage(UIImage(named: "filter"), for: .normal)
		filterButton.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
		
		// TODO: Check if there are safer ways to do this
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileButton)
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: filterButton)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc private func profileButtonPressed() {
		
		let menu = SideMenuNavigationController(rootViewController: MenuViewController())
		menu.leftSide = true
		menu.blurEffectStyle = .dark
		
		self.present(menu, animated: true, completion: nil)
		
	}
	
	@objc private func filterButtonPressed() {
		
		let filterViewController: FilterViewController = FilterViewController()
		
		self.present(filterViewController, animated: true, completion: nil)
		
	}
	
	private func setupCollectionView() {
		feedsCollectionView?.dataSource = self
		feedsCollectionView?.delegate = self
		
		feedsCollectionView?.register(UINib(nibName: "FeedsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeedsCollectionViewCell")
	}

	private func setBlurEffect(_ isHidden: Bool) {
		blurEffectView.isHidden = isHidden
	}
	
	private func setNavigationBar(_ isHidden: Bool) {
		self.navigationController?.setNavigationBarHidden(isHidden, animated: false)
	}
	
}

extension FeedsViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel?.feeds.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let cell: FeedsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedsCollectionViewCell", for: indexPath) as? FeedsCollectionViewCell else {
			return UICollectionViewCell()
		}
		
		if let feedsModel: FeedsModel = viewModel?.feeds[indexPath.row] {
			cell.setContents(feedsModel)
		}
		
		cell.layer.shadowOffset = CGSize(width: 0, height: 0)
		cell.layer.shadowColor = UIColor.gray.cgColor
		cell.layer.shadowOpacity = 0.3
		cell.layer.cornerRadius = 8
		
		return cell
	}
	
	
}

extension FeedsViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let width: CGFloat = 375/343 * Device.screenWidth
		let height: CGFloat = 135/343 * width
		
		return CGSize(width: width - 32, height: height)
	}

}

extension FeedsViewController: UICollectionViewDelegate {
	
}

extension FeedsViewController: SideMenuNavigationControllerDelegate {
	
	func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
		self.setBlurEffect(false)
		self.setNavigationBar(true)
	}
	
	func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
		self.setBlurEffect(true)
		self.setNavigationBar(false)
	}
	
}
