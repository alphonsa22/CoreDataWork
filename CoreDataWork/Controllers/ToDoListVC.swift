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
//    var CategoryCoreDataCredObj = CategoryCoreDataCred()
    var CDCategoryMDLArry = [CDCategoryMDL]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
      
    }
    
    // MARK: - Actions
    
    @IBAction func btnManageCategoryAct(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ManageCategoryVC") as! ManageCategoryVC
        vc.CDCategoryMDLArry = CDCategoryMDLArry
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

    // MARK: - Functions
    
    func setUp() {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        getCategoryList()
    }
    
    func getCategoryList() {
        
        CategoryCoreDataCred.shared.getCategoryList { status, catArry in
            if status {
                DispatchQueue.main.async {
                    self.CDCategoryMDLArry = catArry
                    self.categoryCollectionView.reloadData()
                }
            } else {
                let defaultCategory = ["All","Work","Personal","Birthday","Wishlist"]
                
                CategoryCoreDataCred.shared.addCategory(catArry: defaultCategory) { status, catArry  in
                    
                    if status {
                        DispatchQueue.main.async {
                            self.CDCategoryMDLArry = catArry
                            self.categoryCollectionView.reloadData()
                        }
                    } else {
                        print("unable to add the category")
                    }
                }
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
