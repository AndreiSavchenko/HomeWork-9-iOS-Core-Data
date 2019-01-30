//
//  RoomCategory+CoreDataProperties.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 1/26/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//
//

import Foundation
import CoreData


extension RoomCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomCategory> {
        return NSFetchRequest<RoomCategory>(entityName: "RoomCategory")
    }

    @NSManaged public var name: String?
    @NSManaged public var furnitures: NSSet?

}

// MARK: Generated accessors for furnitures
extension RoomCategory {

    @objc(addFurnituresObject:)
    @NSManaged public func addToFurnitures(_ value: Furniture)

    @objc(removeFurnituresObject:)
    @NSManaged public func removeFromFurnitures(_ value: Furniture)

    @objc(addFurnitures:)
    @NSManaged public func addToFurnitures(_ values: NSSet)

    @objc(removeFurnitures:)
    @NSManaged public func removeFromFurnitures(_ values: NSSet)

}
