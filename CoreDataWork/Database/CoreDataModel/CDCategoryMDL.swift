//
//  CDCategoryMDL.swift
//  CoreDataWork
//
//  Created by Alphonsa Varghese on 08/05/23.
//

import Foundation

struct CDCategoryMDL: Codable, Identifiable {
    var id: Int?
    let name: String?
    let isSelected: Bool?
    let catColor: String?
}
