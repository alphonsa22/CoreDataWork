//
//  AddNewCategoryVC.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 01/06/23.
//

import UIKit

class AddNewCategoryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
   
    // MARK: - FUNCTIONS
    
    func setUp() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        dismissAct()
    }

    func dismissAct() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureact(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureact(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
}
