//
//  CDCategoryList+CoreDataClass.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 09/05/23.
//
//

import Foundation
import CoreData


public class CDCategoryList: NSManagedObject {

    func convertToCategoryList() -> CDCategoryListMDL {
        return CDCategoryListMDL(categories: self.convertToCategory())
    }
    
    func convertToCategory() -> [CDCategoryMDL]? {
        
        guard self.categories != nil && self.categories?.count != 0 else { return nil }
        var categories: [CDCategoryMDL] = []
        self.categories?.forEach({ item in
          categories.append(item.convertToCategory())
        })
        return categories
    }
}
