//
//  LoginViewController.swift
//  Awards
//
//  Created by Engkit Satia Riswara on 11/11/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

	@IBOutlet weak var containerView: UIView?
	@IBOutlet weak var TitleLabel: UILabel?
	@IBOutlet weak var logoImageView: UIImageView?
	@IBOutlet weak var emailTextField: UITextField?
	@IBOutlet weak var signInButton: UIButton?
	@IBOutlet weak var loginErrorLabel: UILabel?
	
	private var viewModel: LoginViewModel?
	private var hideErrorStatus: Bool = true
	
	private var loadingIndicator: UIActivityIndicatorView = {
		
		let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
		loadingIndicator.startAnimating()
		loadingIndicator.color = .white
		
		return loadingIndicator
		
	}()
	
	private let blurEffectView: UIVisualEffectView = {
		let blurEffect: UIBlurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		return blurEffectView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.\
		setupViews()
		blurEffectView.frame = view.bounds
		loadingIndicator.center = self.view.center
		view.addSubview(loadingIndicator)
		view.addSubview(blurEffectView)
		view.bringSubviewToFront(loadingIndicator)
	}
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: "LoginViewController", bundle: nil)
	}
	
	convenience init(viewModel: LoginViewModel) {
		self.init()
		self.viewModel = viewModel
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.setNavigationBarHidden(true, animated: true)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		self.navigationController?.setNavigationBarHidden(false, animated: true)
	}
	
	private func setupViews() {
		
		loginErrorLabel?.isHidden = hideErrorStatus
		logoImageView?.image = UIImage(named: "star")
		
		signInButton?.backgroundColor = UIColor.black
		signInButton?.layer.cornerRadius = 8
		signInButton?.setTitleColor(UIColor.white, for: .normal)
		signInButton?.addTarget(self, action: #selector(doLogin), for: .touchUpInside)
		
		loadingIndicator.isHidden = true
		blurEffectView.isHidden = true
	}
	
	private func showLoading() {
		
		self.loadingIndicator.isHidden = false
		self.blurEffectView.isHidden = false
		
	}
	
	private func hideLoading() {
		
		self.loadingIndicator.isHidden = true
		self.blurEffectView.isHidden = true
		
	}
	
	@objc private func doLogin() {
		
		guard let emailAddress: String = emailTextField?.text else {
			return
		}

		if emailAddress.isEmpty {

		} else {
			performLogin(with: emailAddress)
		}
		
	}
	
	private func performLogin(with email: String) {
		
		self.showLoading()
		
		viewModel?.performLogin(with: email, completion: { [weak self] (success) in
			
			guard let strongSelf = self else {
				return
			}
			
			strongSelf.hideLoading()
			
			if success {
				
				strongSelf.resetFields()
				
				strongSelf.navigateToFeeds()
				
				
			} else {
				// TODO Engkit: unhide error validation message here
				strongSelf.hideErrorStatus = !strongSelf.hideErrorStatus
				strongSelf.loginErrorLabel?.isHidden = strongSelf.hideErrorStatus
				strongSelf.resetFields()
			}
			
		})
	}
	
	private func navigateToFeeds() {
		let feedsViewController: FeedsViewController = FeedsViewController(viewModel: FeedsViewModel())
		
		self.navigationController?.pushViewController(feedsViewController, animated: true)
	}
	
	private func resetFields() {
		emailTextField?.text = ""
	}
}
