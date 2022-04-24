//
//  User+CoreDataProperties.swift
//  DemoCoreData
//
//  Created by Nguyen Duc Chau on 13/04/2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var age: Int16

}

extension User : Identifiable {

}
