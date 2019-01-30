//
//  Furniture+CoreDataProperties.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 1/26/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Furniture {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Furniture> {
        return NSFetchRequest<Furniture>(entityName: "Furniture")
    }

    @NSManaged public var brand: String?
    @NSManaged public var country: String?
    @NSManaged public var material: String?
    @NSManaged public var price: Int32
    @NSManaged public var quantity: Int32
    @NSManaged public var title: String?
    @NSManaged public var cart: Cart?
    @NSManaged public var roomCategory: NSSet?

}

// MARK: Generated accessors for roomCategory
extension Furniture {

    @objc(addRoomCategoryObject:)
    @NSManaged public func addToRoomCategory(_ value: RoomCategory)

    @objc(removeRoomCategoryObject:)
    @NSManaged public func removeFromRoomCategory(_ value: RoomCategory)

    @objc(addRoomCategory:)
    @NSManaged public func addToRoomCategory(_ values: NSSet)

    @objc(removeRoomCategory:)
    @NSManaged public func removeFromRoomCategory(_ values: NSSet)

}
