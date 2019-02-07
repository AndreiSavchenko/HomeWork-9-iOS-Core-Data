//
//  ResultSearchFilterViewController.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 2/7/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit
import CoreData

class ResultSearchFilterViewController: UIViewController {

    @IBOutlet weak var resultSearchTableView: UITableView!
    
    private lazy var context = CoreDataStack.shared.persistentContainer.viewContext
    var filterCategory: String = ""
    var filterName: String = ""
    var fromPriceFilter: UInt = 0
    var beforPriceFilter: UInt = 1000000
    private lazy var fetchedResultsController: NSFetchedResultsController<Furniture> = {
        let fetchRequest: NSFetchRequest<Furniture> = Furniture.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        if filterCategory != "" {
            fetchRequest.predicate = NSPredicate(format: "\(filterCategory) == %@", filterName)
        }
        if fromPriceFilter != 0 || beforPriceFilter != 1000000 {
            fetchRequest.predicate = NSPredicate(format: "(\(fromPriceFilter) <= price) AND (price <= \(beforPriceFilter))")
        }
        
        let controller = NSFetchedResultsController<Furniture>(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        controller.delegate = self
        try? controller.performFetch()
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "FurnitureXibTableViewCell", bundle: nil)
        resultSearchTableView.register(cellNib, forCellReuseIdentifier: FurnitureXibTableViewCell.reuseIdentifier)
    }
    
}

extension ResultSearchFilterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("fetchedResultsController.fetchedObjects?.count ?? 0 = \(fetchedResultsController.fetchedObjects?.count ?? 0)")
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultSearchTableView.dequeueReusableCell(withIdentifier: FurnitureXibTableViewCell.reuseIdentifier, for: indexPath)
        (cell as? FurnitureXibTableViewCell)?.titleLabel.text = fetchedResultsController.fetchedObjects?[indexPath.row].title
        (cell as? FurnitureXibTableViewCell)?.priceLabel.text = String(fetchedResultsController.fetchedObjects?[indexPath.row].price ?? 0)
        if fetchedResultsController.fetchedObjects?[indexPath.row].title == "Стул" {
            (cell as? FurnitureXibTableViewCell)?.furnitureImageView.image =
                UIImage(named: "stulForCell")
        }
        if fetchedResultsController.fetchedObjects?[indexPath.row].title == "Шкаф" {
            (cell as? FurnitureXibTableViewCell)?.furnitureImageView.image =
                UIImage(named: "shkafForCell")
        }
        if fetchedResultsController.fetchedObjects?[indexPath.row].title == "Стол" {
            (cell as? FurnitureXibTableViewCell)?.furnitureImageView.image =
                UIImage(named: "stolForCell")
        }
        if fetchedResultsController.fetchedObjects?[indexPath.row].title == "Диван" {
            (cell as? FurnitureXibTableViewCell)?.furnitureImageView.image =
                UIImage(named: "divanForCell")
        }
        return cell
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let object = fetchedResultsController.fetchedObjects?[indexPath.row]
//
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailFurnitureViewController = storyBoard.instantiateViewController(withIdentifier: "DetailFurnitureViewController") as! DetailFurnitureViewController
//
//        detailFurnitureViewController.objectFurniture = object
//
//        self.navigationController?.pushViewController(detailFurnitureViewController, animated: true)
//    }
}

extension ResultSearchFilterViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        resultSearchTableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            resultSearchTableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            resultSearchTableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .move:
            break
        case .update:
            break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            resultSearchTableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            resultSearchTableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            resultSearchTableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            resultSearchTableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        resultSearchTableView.endUpdates()
    }
}
