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
    
    // MARK: - Variables
    var CDCategoryMDLArry = [CDCategoryMDL]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    @IBAction func btnAddNewCategoryAct(_ sender: UIButton) {
        print("add new clicked")
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewCategoryVC") as? AddNewCategoryVC else {
            return
        }
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    // MARK: - Functions

    func setUp() {
        tblCategoryList.delegate = self
        tblCategoryList.dataSource = self
    }

    func addCategory() {
        
    }
}

extension ManageCategoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if section == 0 {
            return CDCategoryMDLArry.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryTVC", for: indexPath) as? categoryTVC else {
                return UITableViewCell()
            }
            cell.lblCatName.text = CDCategoryMDLArry[indexPath.row].name
            cell.viewCategoryTag.backgroundColor = UIColor.init(hexString: "#\(CDCategoryMDLArry[indexPath.row].catColor ?? "#a2d2ff")")
            cell.viewCategoryTag.layer.cornerRadius = cell.viewCategoryTag.frame.height / 2
            return cell
                
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "addNewTVC", for: indexPath) as? addNewTVC else {
                return UITableViewCell()
            }
            cell.btnCreateNewCategory.tag = indexPath.row
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("indexpath = ", indexPath.row)
        } else {
         
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 55
        } else {
            return 60
        }
    }
    
}
