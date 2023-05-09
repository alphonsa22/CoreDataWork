//
//  CDCategory+CoreDataClass.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 09/05/23.
//
//

import Foundation
import CoreData


public class CDCategory: NSManagedObject {
    func convertToCategory() -> CDCategoryMDL {
            return CDCategoryMDL(name: self.name, isSelected: self.isSelected)
        }
}
