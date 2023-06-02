//
//  AddNewCategoryVC.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 01/06/23.
//

import UIKit

class AddNewCategoryVC: UIViewController {

    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var viewAddCategoryBg: UIView!
    @IBOutlet weak var textViewAddCategory: UITextView!
    @IBOutlet weak var lblDefaultColor: UILabel!
    @IBOutlet weak var ViewselectedCategoryColor: UIView!
    @IBOutlet weak var collectionViewCategoryColor: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    // MARK: - ACTIONS
   
    @IBAction func btnAddColorAct(_ sender: UIButton) {
    }
    
    // MARK: - FUNCTIONS
    
    func setUp() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        dismissAct()
        viewBg.layer.cornerRadius = 10
        viewAddCategoryBg.layer.cornerRadius = 5
        viewAddCategoryBg.layer.borderWidth = 0.5
        viewAddCategoryBg.backgroundColor = .white
        viewAddCategoryBg.layer.borderColor = UIColor.gray.cgColor
        viewAddCategoryBg.clipsToBounds = true
        ViewselectedCategoryColor.layer.cornerRadius = ViewselectedCategoryColor.frame.height / 2
        collectionViewCategoryColor.delegate = self
        collectionViewCategoryColor.dataSource = self
    }

    @IBAction func btnCatColorAct(_ sender: UIButton) {
    }
    
    func dismissAct() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureact(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureact(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
}

extension AddNewCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryColorCVC", for: indexPath) as? CategoryColorCVC else {
            return UICollectionViewCell()
        }
        cell.viewCatColor.backgroundColor = .brown
        cell.viewCatColor.layer.cornerRadius = cell.viewCatColor.frame.height / 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 35, height: 45)
    }
    
}
