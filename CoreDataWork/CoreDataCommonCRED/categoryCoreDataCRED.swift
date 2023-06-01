//
//  categoryCoreDataCRED.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 12/05/23.
//

import Foundation
import CoreData

class CategoryCoreDataCred: NSObject {
    
    static let shared = CategoryCoreDataCred()
    
    func addCategory(catArry: [String], _ completion: @escaping(_ status: Bool, _ catArry: [CDCategoryMDL])->Void) {
        
//        let defaultCategory = ["All","Work","Personal","Birthday","Wishlist"]
        var cdCategoryArry = [CDCategoryMDL]()
        catArry.forEach { item in
            if item == "All" {
                cdCategoryArry.append(CDCategoryMDL(name: item, isSelected: true, catColor: "a2d2ff"))
            } else {
                cdCategoryArry.append(CDCategoryMDL(name: item, isSelected: false, catColor: "a2d2ff"))
            }
        }
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        CoreDataManager.shared.persistentContainer.performBackgroundTask { newContext in
            
            var categoryList = CDCategoryList(context: context)
            categoryList.categories = []
            cdCategoryArry.forEach { item in
                let perCategory = CDCategory(context: context)
                perCategory.name = item.name
                perCategory.isSelected = item.name == "All" ? true : false
                perCategory.catColor = item.catColor
                perCategory.cdCateList = categoryList

            }
            
            do {
                if(context.hasChanges) {
                    try? context.save()
                    try context.parent?.save()
                    completion(true, cdCategoryArry)
                }
            } catch let error {
                print("Failed To Save:",error)
                completion(false, [])
            }
            
        }
    }
    
    func getCategoryList(_ completion: @escaping(_ status: Bool, _ catArry: [CDCategoryMDL]) -> Void) {
        
        let records = CoreDataManager.shared.fetchManagedObject(managedObject: CDCategoryList.self)
        guard records != nil && records?.count != 0 else {
            print("no category record found.")
            completion(false, [])
            return
        }
        var CDCategoryMDLArry = [CDCategoryMDL]()
        records!.forEach { item in
            
            let categoryItem = item.convertToCategoryList()
            print("category items = ", categoryItem.categories ?? [])
            
            CDCategoryMDLArry = categoryItem.categories ?? []
        }
        
        completion(true,CDCategoryMDLArry)
        
    }
}
