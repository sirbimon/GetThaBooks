//
//  File.swift
//  GetTheBooks
//
//  Created by Bimonaretga on 3/14/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import Foundation

class BookDataStore {
    private init() {
    }
    
    static var sharedInstance = BookDataStore()
    
    var books = [Book]()
    
    var imageCache = NSCache<AnyObject, AnyObject>()

    func populateBooks( completion: @escaping () -> ()) {
        
        BooksAPIClient.getListOfBooks { (books) in
            self.books.removeAll()
            for book in books {
                let newBook = Book(dictionary: book)
                self.books.append(newBook)
                print("added", newBook.title)
            }
            completion()
        }
    }
    
    
    
    
}
