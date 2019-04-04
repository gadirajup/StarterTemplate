//
//  ViewController.swift
//  StarterTemplate
//
//  Created by Prudhvi Gadiraju on 4/4/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    var delegate: HomeControllerDelegate?
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initNavBar()
    }
    
    fileprivate func initView() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    fileprivate func initNavBar() {
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Slide Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    // MARK: - Handlers
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle()
    }
}

