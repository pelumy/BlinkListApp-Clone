//
//  CellSection.swift
//  bookApp
//
//  Created by mac on 02/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit
class CellSection : UICollectionReusableView {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var bookDescription: UILabel!
    
    @IBOutlet weak var access: UILabel!
    var sectionHeader: String! {
        didSet {
            title.text = sectionHeader
        }
    }
    var descriptionHeader: String! {
        didSet {
            bookDescription.text = descriptionHeader
        }
    }
    var accessHeader: String! {
        didSet {
            access.text = accessHeader
        }
    }
    
    
}
