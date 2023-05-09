//
//  Category+CoreDataProperties.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 09/05/23.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "CDCategory")
    }

    @NSManaged public var name: String?
    @NSManaged public var isSelected: Bool

}

extension Category : Identifiable {

}
