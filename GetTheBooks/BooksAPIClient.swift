//
//  BooksAPIClient.swift
//  GetTheBooks
//
//  Created by Bimonaretga on 3/14/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import Foundation
import Alamofire

class BooksAPIClient {
    
    class func getListOfBooks(completion: @escaping ([[String: Any]]) -> ()) {
        print("getting list of books!")
        let urlStringo = "https://flatironchallenge.herokuapp.com/books"
        let url = URL(string: urlStringo)
        guard let unwrappedURL = url else { print("url invalid"); return }
        Alamofire.request(unwrappedURL).responseJSON { (response) in
            guard (response.error == nil) else { print(response.error!); return }
            
            let json = response.result.value as? [[String: Any]] ?? [[:]]
            print(json)
            completion(json)
            
            
        }
        
    }
    
    class func addBook(book: Book, completion: @escaping ()->()) {

        
        let parameters: Parameters = [
            "author": "\(book.author)",
            "title": "\(book.title)",
            "publisher": "\(book.publisher)",
            "url": "\(book.url)"
        ]
        
        Alamofire.request("https://flatironchallenge.herokuapp.com/books", method: .post, parameters: parameters, encoding: JSONEncoding.default).response { (response) in
            if response.error != nil {
                print(response.error!)
            }
            print(response.response?.statusCode)
            completion()
        }
    }
    
    class func getTheBook(book: Book, completion: @escaping (Book)->()) {
        let id = book.id
        Alamofire.request("https://flatironchallenge.herokuapp.com/books/\(id)").responseJSON { (response) in
            if response.error != nil {
                print(response.error!)
            }
            
            print(response.result.value)
            let json = response.result.value as? [String: Any] ?? [:]
            let newBook = Book(dictionary: json)
            completion(newBook)
        }
    }
    
}
