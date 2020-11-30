//
//  FileContent.swift
//  bookApp
//
//  Created by mac on 02/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

struct BookContent: Codable {
  
    var title, description, access : String
    var books : [Book]
}


