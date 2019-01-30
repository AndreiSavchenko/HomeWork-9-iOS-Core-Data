//
//  ViewController.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 1/26/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override var selectedViewController: UIViewController? {
        didSet {
            navigationItem.title = selectedViewController?.title
            
            if navigationItem.title == "Furniture" {
                navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addAction(_:)))
            } else if navigationItem.title == "Room Category" {
                navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addAction(_:)))
            } else {
                navigationItem.rightBarButtonItem = nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @objc private func addAction(_ sender: UIBarButtonItem) {
        (selectedViewController as? FurnitureViewController)?.addAction()
    }
}

