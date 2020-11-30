//
//  File.swift
//  bookApp
//
//  Created by mac on 02/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit
class SecondScreenController: UIViewController {
    

    @IBOutlet weak var bookImage: UIImageView!
    
    @IBOutlet weak var narrator: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookDuration: UILabel!
    
    var books : Book?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let books = books {
            bookImage.image = UIImage(named: books.bookImage)
            bookAuthor.text = books.bookAuthor
            bookTitle.text = books.bookTitle
            bookDuration.text = "\(books.bookDuration) hrs"

        }

    }
}
