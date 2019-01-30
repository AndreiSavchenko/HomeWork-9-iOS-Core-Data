//
//  FurnitureDetalsViewController.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 1/28/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class AddFurnitureViewController: UIViewController {

    private lazy var context = CoreDataStack.shared.persistentContainer.viewContext
    //var furniture = Furniture.fetchAll()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var materialTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    @IBAction func addNewFurnitureButton(_ sender: UIButton) {
    
        let object = Furniture(context: context)
        object.title = titleTextField.text
        object.brand = brandTextField.text
        object.country = countryTextField.text
        object.material = materialTextField.text
        guard let price = priceTextField.text else { return }
        object.price = Int32(price) ?? 0
        guard let quantity = quantityTextField.text else { return }
        object.quantity = Int32(quantity) ?? 0
        try? context.save()
        //self.furniture = Furniture.fetchAll()
        
        print("add Furniture button")
//        print("furniture.count = \(furniture.count)")
//        print("furniture = \(furniture)")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
