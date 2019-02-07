//
//  DelFurnitureViewController.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 1/31/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class DetailFurnitureViewController: UIViewController {
    
    private lazy var context = CoreDataStack.shared.persistentContainer.viewContext
    var objectFurniture: Furniture?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var materialTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    
    @IBAction func saveChangeFurnitureButton(_ sender: UIButton) {
        guard let object = objectFurniture else { return }
//        context.delete(object)
        guard let price = Int32(priceTextField.text!) else { return }
        guard let quantity = Int32(quantityTextField.text!) else { return }
//
//        let object = Furniture(context: context)
        object.title = titleTextField.text
        object.brand = brandTextField.text
        object.country = countryTextField.text
        object.material = materialTextField.text
        object.price = price
        object.quantity = quantity
//        try? context.save()
        
        
        
        try? context.save()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteFurnitureButton(_ sender: UIButton) {

        guard let object = objectFurniture else { return }
        context.delete(object)
        try? context.save()
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let price = objectFurniture?.price else { return }
        guard let quantity = objectFurniture?.quantity else { return }
        titleTextField.text = objectFurniture?.title
        brandTextField.text = objectFurniture?.brand
        countryTextField.text = objectFurniture?.country
        materialTextField.text = objectFurniture?.material
        priceTextField.text = String(price)
        quantityTextField.text = String(quantity)
    }
}
