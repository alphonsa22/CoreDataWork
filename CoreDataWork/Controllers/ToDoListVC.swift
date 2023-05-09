//
//  ToDoListVC.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 08/05/23.
//

import UIKit
import CoreData

class ToDoListVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var CDCategoryMDLArry = [CDCategoryMDL]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
      
    }
    
    // MARK: - Actions
    
    @IBAction func btnManageCategoryAct(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ManageCategoryVC") as! ManageCategoryVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

    // MARK: - Functions
    
    func setUp() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        getCategoryList()
    }
    
    func getCategoryList() {
        
        let records = CoreDataManager.shared.fetchManagedObject(managedObject: CDCategoryList.self)
        guard records != nil && records?.count != 0 else {
            print("no category record found.")
            self.addCategory()
            return
        }
        
        records!.forEach { item in
            
            let categoryItem = item.convertToCategoryList()
            print("category items = ", categoryItem.categories ?? [])
            
            self.CDCategoryMDLArry = categoryItem.categories ?? []
        }
        
        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
        }
    }

    func addCategory() {
        
        let defaultCategory = ["All","Work","Personal","Birthday","Wishlist"]
        var cdCategoryArry = [CDCategoryMDL]()
        defaultCategory.forEach { item in
            if item == "All" {
                cdCategoryArry.append(CDCategoryMDL(name: item, isSelected: true))
            } else {
                cdCategoryArry.append(CDCategoryMDL(name: item, isSelected: false))
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
                perCategory.cdCateList = categoryList

            }
            
            do {
                if(context.hasChanges) {
                    try? context.save()
                    try context.parent?.save()
                    self.getCategoryList()
                }
            } catch let error {
                print("Failed To Save:",error)
            }
            
        }
        
    }
}

extension ToDoListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CDCategoryMDLArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCVC", for: indexPath) as? categoryCVC else {
            return UICollectionViewCell()
        }
        let item = CDCategoryMDLArry[indexPath.row]
        cell.lblCatName.text = item.name
        cell.viewBg.backgroundColor = UIColor(named: "CategoryBG")
        cell.viewBg.layer.cornerRadius = cell.viewBg.frame.height / 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
           let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
           let size: CGFloat = (collectionView.frame.size.width - space) / 2.0
           return CGSize(width: size, height: size)
    }
    
}
