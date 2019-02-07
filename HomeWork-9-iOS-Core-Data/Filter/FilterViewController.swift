//
//  FilterViewController.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 2/7/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    
    @IBOutlet weak var fromPriceTextField: UITextField!
    @IBOutlet weak var beforPriceTextField: UITextField!
    
    @IBAction func searchPriceButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resultSearchFilterViewController = storyBoard.instantiateViewController(withIdentifier: "ResultSearchFilterViewController") as! ResultSearchFilterViewController
        guard let fromPriceFilter = UInt(fromPriceTextField.text!) else { return }
        guard let beforPriceFilter = UInt(beforPriceTextField.text!) else { return }
        resultSearchFilterViewController.fromPriceFilter = fromPriceFilter
        resultSearchFilterViewController.beforPriceFilter = beforPriceFilter
        self.navigationController?.pushViewController(resultSearchFilterViewController, animated: true)
    }
    
    @IBAction func searchIkeaButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resultSearchFilterViewController = storyBoard.instantiateViewController(withIdentifier: "ResultSearchFilterViewController") as! ResultSearchFilterViewController
        resultSearchFilterViewController.filterCategory = "brand"
        resultSearchFilterViewController.filterName = "Икеа"
        self.navigationController?.pushViewController(resultSearchFilterViewController, animated: true)
    }
    
    @IBAction func searchBlestButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resultSearchFilterViewController = storyBoard.instantiateViewController(withIdentifier: "ResultSearchFilterViewController") as! ResultSearchFilterViewController
        resultSearchFilterViewController.filterCategory = "brand"
        resultSearchFilterViewController.filterName = "Блест"
        self.navigationController?.pushViewController(resultSearchFilterViewController, animated: true)
    }
    
    @IBAction func searchLivsButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resultSearchFilterViewController = storyBoard.instantiateViewController(withIdentifier: "ResultSearchFilterViewController") as! ResultSearchFilterViewController
        resultSearchFilterViewController.filterCategory = "brand"
        resultSearchFilterViewController.filterName = "Ливс"
        self.navigationController?.pushViewController(resultSearchFilterViewController, animated: true)
    }
    
    @IBAction func searchUkrainButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resultSearchFilterViewController = storyBoard.instantiateViewController(withIdentifier: "ResultSearchFilterViewController") as! ResultSearchFilterViewController
        resultSearchFilterViewController.filterCategory = "country"
        resultSearchFilterViewController.filterName = "Украина"
        self.navigationController?.pushViewController(resultSearchFilterViewController, animated: true)
    }
    
    @IBAction func searchSwedenButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resultSearchFilterViewController = storyBoard.instantiateViewController(withIdentifier: "ResultSearchFilterViewController") as! ResultSearchFilterViewController
        resultSearchFilterViewController.filterCategory = "country"
        resultSearchFilterViewController.filterName = "Швеция"
        self.navigationController?.pushViewController(resultSearchFilterViewController, animated: true)
    }
    
    @IBAction func searchUsaButton(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resultSearchFilterViewController = storyBoard.instantiateViewController(withIdentifier: "ResultSearchFilterViewController") as! ResultSearchFilterViewController
        resultSearchFilterViewController.filterCategory = "country"
        resultSearchFilterViewController.filterName = "США"
        self.navigationController?.pushViewController(resultSearchFilterViewController, animated: true)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
