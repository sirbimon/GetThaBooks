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
    var lastCheckedOutBy: String
    var lastCheckedOut: String
    var checkoutDetails: [String : Any] = [:]
    
    init(dictionary: [String: Any]) {
        self.author = dictionary["author"] as? String ?? "No author"
        self.id = dictionary["id"] as? Int ?? 666
        self.publisher = dictionary["publisher"] as? String ?? "No publisher"
        self.title = dictionary["title"] as? String ?? "no title"
        self.url = dictionary["url"] as? String ?? ""
        self.lastCheckedOut = dictionary["lastcheckedout"] as? String ?? "no detail"
        self.lastCheckedOutBy = dictionary["lastcheckedoutby"] as? String ?? "no name"
        
    }
    
    mutating func bookCheckedOut(name: String) {
        checkoutDetails = [
            "lastcheckedout": true,
            "lastcheckedoutby":"\(name): \(NSDate().string)"
        ]
        
    }
    
    
    //struct is a value tup
    
}

extension NSDate {
    
    var string: String {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMM d, yyyy")
            let dateString = dateFormatter.string(from: self as Date)
            return dateString
    }
    
}
