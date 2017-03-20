//
//  Book.swift
//  GetTheBooks
//
//  Created by Bimonaretga on 3/14/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import Foundation

struct Book {
    var author: String
    var id: Int
    var publisher: String
    var title: String
    var url: String
    
    init(dictionary: [String: Any]) {
        self.author = dictionary["author"] as? String ?? "No author"
        self.id = dictionary["id"] as? Int ?? 666
        self.publisher = dictionary["publisher"] as? String ?? "No publisher"
        self.title = dictionary["title"] as? String ?? "no title"
        self.url = dictionary["url"] as? String ?? ""
        
    }
    
}
