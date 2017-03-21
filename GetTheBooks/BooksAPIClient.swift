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
        let urlStringo = "https://flatironchallenge.herokuapp.com/books" //store this as a variable
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
            print(response.response?.statusCode as Any)
            completion()
        }
    }
    
    class func getTheBook(book: Book, completion: @escaping (Book)->()) { //getBook or even just get(book:) and probably slim it down so you don't need to much flak out of it. 
        let id = book.id
        Alamofire.request("https://flatironchallenge.herokuapp.com/books/\(id)").responseJSON { (response) in
            if response.error != nil {
                print(response.error!)
            }
            
            print(response.result.value as Any)
            let json = response.result.value as? [String: Any] ?? [:]
            let newBook = Book(dictionary: json)
            completion(newBook)
        }
    }
    
    class func editTheBook(bookId: String, withDictionary dictionary: [String: Any], completion: @escaping ()->()) {
        let parameters: Parameters = dictionary
        Alamofire.request("https://flatironchallenge.herokuapp.com/books/\(bookId)", method: .put, parameters: parameters, encoding: JSONEncoding.default).response { (response) in
            print(response.response?.statusCode as Any)
            completion()
        }
    }
    
    class func checkoutBook(_ book: Book, completion: @escaping (Bool)-> Void) {
        Alamofire.request("https://flatironchallenge.herokuapp.com/books/\(book.id)", method: .put, parameters: book.checkoutDetails, encoding: JSONEncoding.default).response { (response) in
            print(response.response?.statusCode as Any)
            completion(true)
        }

    }
    
//    class func checkoutBook(bookId: Int, detailsDictionary dictionary: [String: Any],  completion: @escaping ()->()) {
//        let parameters: Parameters = dictionary
//        Alamofire.request("https://flatironchallenge.herokuapp.com/books/\(bookId)", method: .put, parameters: parameters, encoding: JSONEncoding.default).response { (response) in
//            print(response.response?.statusCode as Any)
//            completion()
//        }
//    }
    
    
}
