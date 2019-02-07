//
//  FurnitureDetalsViewController.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 1/28/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit
import CoreData

class AddFurnitureViewController: UIViewController, UITextFieldDelegate {

    private lazy var context = CoreDataStack.shared.persistentContainer.viewContext
    
    @IBOutlet weak var doneHiddenButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var materialTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    @IBOutlet weak var customPickerView: UIPickerView!
    var pickerDataTitle = ["Стул", "Диван", "Стол", "Шкаф"]
    var pickerDataBrand = ["Икеа", "Блест", "Ливс"]
    var pickerDataCountry = ["Украина", "Швеция", "США"]
    var pickerDataMaterial = ["Дерево", "Метал", "Стекло"]
//    var pickerDataRoomCategory: NSFetchRequest<RoomCategory> = RoomCategory.fetchRequest()
//    var pickerDataRoomCategory = RoomCategory.fetchAllName()
    
    var pickerData: [String] = []
    
    @IBAction func addNewFurnitureButton(_ sender: UIButton) {
        guard let price = Int32(priceTextField.text!) else { return }
        guard let quantity = Int32(quantityTextField.text!) else { return }
        
        let object = Furniture(context: context)
        object.title = titleTextField.text
        object.brand = brandTextField.text
        object.country = countryTextField.text
        object.material = materialTextField.text
        object.price = price
        object.quantity = quantity

        try? context.save()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.brandTextField {
            pickerData = pickerDataBrand
        }
        if textField == self.countryTextField {
            pickerData = pickerDataCountry
        }
        if textField == self.titleTextField {
            pickerData = pickerDataTitle
        }
        if textField == self.materialTextField {
            pickerData = pickerDataMaterial
        }
        customPickerView.reloadAllComponents()
        customPickerView.isHidden = false
        doneHiddenButton.isHidden = false
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        customPickerView.isHidden = true
        doneHiddenButton.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("pickerDataRoomCategory = \(pickerDataRoomCategory)")
        }
}

extension AddFurnitureViewController: UIPickerViewDelegate, UIPickerViewDataSource {
 
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerData == pickerDataBrand {
            brandTextField.text = pickerData[row]
        }
        if pickerData == pickerDataCountry {
            countryTextField.text = pickerData[row]
        }
        if pickerData == pickerDataTitle {
            titleTextField.text = pickerData[row]
        }
        if pickerData == pickerDataMaterial {
            materialTextField.text = pickerData[row]
        }
    }
}
