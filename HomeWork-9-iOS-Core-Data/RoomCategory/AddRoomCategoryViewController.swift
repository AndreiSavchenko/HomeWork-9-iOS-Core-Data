//
//  AddRoomCategoryViewController.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 2/6/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class AddRoomCategoryViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var context = CoreDataStack.shared.persistentContainer.viewContext
    
    @IBOutlet weak var addRoomHiddenButton: UIButton!
    @IBOutlet weak var doneHiddenButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameRoomPickerView: UIPickerView!
    
    var pickerDataName = ["Ванна", "Главная комната", "Спальня", "Детская", "Кухня"]
    
    @IBAction func addNewRoomCategoryButton(_ sender: UIButton) {
        
        let object = RoomCategory(context: context)
        object.name = nameTextField.text
        try? context.save()
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        nameRoomPickerView.isHidden = false
        doneHiddenButton.isHidden = false
        addRoomHiddenButton.isHidden = true
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        nameRoomPickerView.isHidden = true
        doneHiddenButton.isHidden = true
        addRoomHiddenButton.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension AddRoomCategoryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataName[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameTextField.text = pickerDataName[row]
    }
}

