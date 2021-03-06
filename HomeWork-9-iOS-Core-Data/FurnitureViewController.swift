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
    private lazy var context = CoreDataStack.shared.persistentContainer.viewContext
    
    private lazy var fetchedResultsController: NSFetchedResultsController<Furniture> = {
        let fetchRequest: NSFetchRequest<Furniture> = Furniture.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
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
        furnitureTableView.register(cellNib, forCellReuseIdentifier: FurnitureXibTableViewCell.reuseIdentifier)
    }
    
    func addAction() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addFurnitureViewController = storyBoard.instantiateViewController(withIdentifier: "AddFurnitureViewController") as! AddFurnitureViewController
        self.navigationController?.pushViewController(addFurnitureViewController, animated: true)
    }
}

extension FurnitureViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = furnitureTableView.dequeueReusableCell(withIdentifier: FurnitureXibTableViewCell.reuseIdentifier, for: indexPath)
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = fetchedResultsController.fetchedObjects?[indexPath.row]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailFurnitureViewController = storyBoard.instantiateViewController(withIdentifier: "DetailFurnitureViewController") as! DetailFurnitureViewController
        
        detailFurnitureViewController.objectFurniture = object

       self.navigationController?.pushViewController(detailFurnitureViewController, animated: true)
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
