//
//  RoomCategoryViewController.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 2/5/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit
import CoreData

class RoomCategoryViewController: UIViewController {

    @IBOutlet weak var roomCategoryTableView: UITableView!
    private lazy var context = CoreDataStack.shared.persistentContainer.viewContext
    
    private lazy var fetchedResultsController: NSFetchedResultsController<RoomCategory> = {
        let fetchRequest: NSFetchRequest<RoomCategory> = RoomCategory.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let controller = NSFetchedResultsController<RoomCategory>(
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
        let cellNib = UINib(nibName: "RoomCategoryXibTableViewCell", bundle: nil)
        roomCategoryTableView.register(cellNib, forCellReuseIdentifier: RoomCategoryXibTableViewCell.reuseIdentifier)
    }
    
    func addAction() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addRoomCategoryViewController = storyBoard.instantiateViewController(withIdentifier: "AddRoomCategoryViewController") as! AddRoomCategoryViewController
        self.navigationController?.pushViewController(addRoomCategoryViewController, animated: true)
    }


}

extension RoomCategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = roomCategoryTableView.dequeueReusableCell(withIdentifier: RoomCategoryXibTableViewCell.reuseIdentifier, for: indexPath)
        (cell as? RoomCategoryXibTableViewCell)?.nameRoomLabel.text = fetchedResultsController.fetchedObjects?[indexPath.row].name
        if fetchedResultsController.fetchedObjects?[indexPath.row].name == "Спальня" {
            (cell as? RoomCategoryXibTableViewCell)?.roomCategoryImageView.image =
                UIImage(named: "bedRoom")
        }
        if fetchedResultsController.fetchedObjects?[indexPath.row].name == "Детская" {
            (cell as? RoomCategoryXibTableViewCell)?.roomCategoryImageView.image =
                UIImage(named: "kidsBedroom")
        }
        if fetchedResultsController.fetchedObjects?[indexPath.row].name == "Кухня" {
            (cell as? RoomCategoryXibTableViewCell)?.roomCategoryImageView.image =
                UIImage(named: "kitchenRoom")
        }
        if fetchedResultsController.fetchedObjects?[indexPath.row].name == "Ванна" {
            (cell as? RoomCategoryXibTableViewCell)?.roomCategoryImageView.image =
                UIImage(named: "bathRoom")
        }
        if fetchedResultsController.fetchedObjects?[indexPath.row].name == "Главная комната" {
            (cell as? RoomCategoryXibTableViewCell)?.roomCategoryImageView.image =
                UIImage(named: "mainRoom")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let object = fetchedResultsController.fetchedObjects?[indexPath.row] else { return }
            context.delete(object)
            try? context.save()
        }
    }
}

extension RoomCategoryViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        roomCategoryTableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            roomCategoryTableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            roomCategoryTableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .move:
            break
        case .update:
            break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            roomCategoryTableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            roomCategoryTableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            roomCategoryTableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            roomCategoryTableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        roomCategoryTableView.endUpdates()
    }
}
