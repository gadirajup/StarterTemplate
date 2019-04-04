//
//  ContainerController.swift
//  StarterTemplate
//
//  Created by Prudhvi Gadiraju on 4/4/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    
    var menuController: MenuController!
    var homeViewController: HomeViewController!
    var isExpanded = false
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initHomeController()
    }
    
    fileprivate func initView() {
        
    }
    
    fileprivate func initHomeController() {
        homeViewController = HomeViewController()
        homeViewController.delegate = self
        let controller = UINavigationController(rootViewController: homeViewController)
        
        // Another way to make itself parent. neeto
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
    
    fileprivate func initMenuController() {
        if menuController == nil {
            menuController = MenuController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    // MARK: - Handlers
    
    fileprivate func showMenuController(shouldExpand: Bool) {
        if shouldExpand {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.homeViewController.view.frame.origin.x = self.homeViewController.view.frame.width - 80
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.homeViewController.view.frame.origin.x = 0
            }, completion: nil)
        }
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle() {
        isExpanded = !isExpanded
        print(isExpanded)
        
        if isExpanded {
            initMenuController()
        }
        showMenuController(shouldExpand: isExpanded)
    }
}
