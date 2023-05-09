//
//  CDCategoryList+CoreDataProperties.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 09/05/23.
//
//

import Foundation
import CoreData


extension CDCategoryList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCategoryList> {
        return NSFetchRequest<CDCategoryList>(entityName: "CDCategoryList")
    }

    @NSManaged public var categories: Set<CDCategory>?

}

// MARK: Generated accessors for categories
extension CDCategoryList {

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: CDCategory)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: CDCategory)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSSet)

}

extension CDCategoryList : Identifiable {

}
