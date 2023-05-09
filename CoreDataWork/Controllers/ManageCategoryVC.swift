//
//  ManageCategoryVC.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 09/05/23.
//

import UIKit

class ManageCategoryVC: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var tblCategoryList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    // MARK: - Functions

    func setUp() {
        tblCategoryList.delegate = self
        tblCategoryList.dataSource = self
    }

}

extension ManageCategoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if section == 0 {
            return 4
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryTVC", for: indexPath) as? categoryTVC else {
                return UITableViewCell()
            }
            return cell
                
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "addNewTVC", for: indexPath) as? addNewTVC else {
                return UITableViewCell()
            }
            
            return cell
        }
    }
    
    
}
