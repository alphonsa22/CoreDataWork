//
//  CDCategoryColors+CoreDataProperties.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 16/05/23.
//
//

import Foundation
import CoreData


extension CDCategoryColors {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCategoryColors> {
        return NSFetchRequest<CDCategoryColors>(entityName: "CDCategoryColors")
    }

    @NSManaged public var catColor: String?
    @NSManaged public var cdColorList: CDColorList?

}

extension CDCategoryColors : Identifiable {

}
