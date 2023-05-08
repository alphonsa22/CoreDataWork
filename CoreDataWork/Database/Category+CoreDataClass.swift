//
//  Category+CoreDataClass.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 08/05/23.
//
//

import Foundation
import CoreData


public class Category: NSManagedObject {

    func convertToCategory() -> CDCategoryMDL {
        return CDCategoryMDL(name: self.name)
    }
}
