//
//  CDCategory+CoreDataProperties.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 09/05/23.
//
//

import Foundation
import CoreData


extension CDCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCategory> {
        return NSFetchRequest<CDCategory>(entityName: "CDCategory")
    }

    @NSManaged public var name: String?
    @NSManaged public var isSelected: Bool

}

extension CDCategory : Identifiable {

}
