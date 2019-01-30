//
//  FurnitureViewController.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 1/26/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit
import CoreData

class FurnitureViewController: UIViewController {
    
    @IBOutlet weak var furnitureTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let cellNib = UINib(nibName: "FurnitureXibTableViewCell", bundle: nil)
//
//        furnitureTableView.register(cellNib, forCellReuseIdentifier: FurnitureXibTableViewCell.reuseIdentifier)
        
//        furnitureTableView.reloadData()
    }
    
    func addAction() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addFurnitureViewController = storyBoard.instantiateViewController(withIdentifier: "AddFurnitureViewController") as! AddFurnitureViewController
        self.navigationController?.pushViewController(addFurnitureViewController, animated: true)
    }

    private lazy var context = CoreDataStack.shared.persistentContainer.viewContext
    
    var furniture = Furniture.fetchAll() {
            didSet {
                furnitureTableView.reloadData()
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddFurnitureViewController {
            vc.furniture = sender as? [Furniture] ?? []
            print("11111")
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "segueAddFurniture" {
//            print("prepare")
//            if let addFurnitureViewController = segue.destination as? AddFurnitureViewController {
//                addFurnitureViewController.furniture = sender as? [Furniture] ?? []
//                self.furnitureTableView.reloadData()
//            }
//        }
//    }

    
}

extension FurnitureViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("furniture.count = \(furniture.count)")
        return furniture.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = furnitureTableView.dequeueReusableCell(withIdentifier: FurnitureXibTableViewCell.reuseIdentifier, for: indexPath)
        (cell as? FurnitureXibTableViewCell)?.titleLabel.text = furniture[indexPath.row].title
        (cell as? FurnitureXibTableViewCell)?.priceLabel.text = String(furniture[indexPath.row].price)
        return cell
    }
}



extension FurnitureViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        furnitureTableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            furnitureTableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            furnitureTableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .move:
            break
        case .update:
            break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            furnitureTableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            furnitureTableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            furnitureTableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            furnitureTableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        furnitureTableView.endUpdates()
    }
}
