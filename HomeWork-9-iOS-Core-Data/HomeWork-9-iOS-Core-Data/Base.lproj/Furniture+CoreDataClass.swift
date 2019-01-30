//
//  Furniture+CoreDataClass.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 1/26/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Furniture)
public class Furniture: NSManagedObject {
    
    class func fetchAll(from context: NSManagedObjectContext = CoreDataStack.shared.persistentContainer.viewContext) -> [Furniture] {
        let request: NSFetchRequest<Furniture> = fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        let furniture = try? context.fetch(request)
        return furniture ?? []
    }

}
