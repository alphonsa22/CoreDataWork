//
//  CDColorList+CoreDataProperties.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 16/05/23.
//
//

import Foundation
import CoreData


extension CDColorList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDColorList> {
        return NSFetchRequest<CDColorList>(entityName: "CDColorList")
    }

    @NSManaged public var catColors: NSSet?

}

// MARK: Generated accessors for catColors
extension CDColorList {

    @objc(addCatColorsObject:)
    @NSManaged public func addToCatColors(_ value: CDCategoryColors)

    @objc(removeCatColorsObject:)
    @NSManaged public func removeFromCatColors(_ value: CDCategoryColors)

    @objc(addCatColors:)
    @NSManaged public func addToCatColors(_ values: NSSet)

    @objc(removeCatColors:)
    @NSManaged public func removeFromCatColors(_ values: NSSet)

}

extension CDColorList : Identifiable {

}
