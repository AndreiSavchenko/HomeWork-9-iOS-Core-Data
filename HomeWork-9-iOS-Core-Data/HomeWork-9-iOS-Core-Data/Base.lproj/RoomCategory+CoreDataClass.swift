//
//  RoomCategory+CoreDataClass.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 1/26/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//
//

import Foundation
import CoreData

@objc(RoomCategory)
public class RoomCategory: NSManagedObject {

    class func fetchAll(from context: NSManagedObjectContext = CoreDataStack.shared.persistentContainer.viewContext) -> [RoomCategory] {
        let request: NSFetchRequest<RoomCategory> = fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let roomCategory = try? context.fetch(request)
        return roomCategory ?? []
    }
    
}
