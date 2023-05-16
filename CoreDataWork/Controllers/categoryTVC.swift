//
//  categoryTVC.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 09/05/23.
//

import UIKit

class categoryTVC: UITableViewCell {

    @IBOutlet weak var viewCategoryTag: UIView!
    @IBOutlet weak var lblCatName: UILabel!
    
    @IBOutlet weak var viewMore: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
