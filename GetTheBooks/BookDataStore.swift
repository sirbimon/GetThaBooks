//
//  BookDataStore.swift
//  GetTheBooks
//
//  Created by Bimonaretga on 3/14/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import Foundation

class BookDataStore { //change the file na
    private init() {
    }
    
    static var sharedInstance = BookDataStore()
    
    var books = [Book]()
    
    var imageCache = NSCache<AnyObject, AnyObject>()

    func populateBooks( completion: @escaping () -> ()) {
        
        BooksAPIClient.getListOfBooks { (bookDictArray) in
            self.books.removeAll()
            for book in bookDictArray {
                let newBook = Book(dictionary: book)
                self.books.append(newBook)
                print("added", newBook.title)
            }
            completion()
        }
    }
    
    func editBook() {
        
    }
    
    
    
    
}
