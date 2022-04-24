//
//  QuaKe.swift
//  DemoCoreData
//
//  Created by Nguyen Duc Chau on 13/04/2022.
//

import Foundation
import CoreData

@objc(Quake)
public class Quake: NSManagedObject {
    
}


import Foundation
import CoreData

extension Quake {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quake> {
        return NSFetchRequest<Quake>(entityName: "Quake")
    }

    @NSManaged public var magnitude: Float
    @NSManaged public var place: String?
    @NSManaged public var time: Date?
    @NSManaged public var countries: NSSet?

}

// MARK: Generated accessors for countries
extension Quake {

    @objc(addCountriesObject:)
    @NSManaged public func addToCountries(_ value: Country)

    @objc(removeCountriesObject:)
    @NSManaged public func removeFromCountries(_ value: Country)

    @objc(addCountries:)
    @NSManaged public func addToCountries(_ values: NSSet)

    @objc(removeCountries:)
    @NSManaged public func removeFromCountries(_ values: NSSet)

}
