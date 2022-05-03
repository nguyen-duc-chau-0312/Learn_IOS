//
//  Item+CoreDataProperties.swift
//  DemoApp
//
//  Created by Nguyen Duc Chau on 25/04/2022.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var title: String?
    @NSManaged public var done: Bool

}

extension Item : Identifiable {

}
