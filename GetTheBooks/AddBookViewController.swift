//
//  AddBookViewController.swift
//  GetTheBooks
//
//  Created by Bimonaretga on 3/15/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UITextField!
    @IBOutlet weak var authorTxtFld: UITextField!
    @IBOutlet weak var publisherTxtFld: UITextField!
    @IBOutlet weak var urlTxtFld: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Add New Book"
    }
    
    @IBAction func addBttnPrssd(_ sender: Any) {
        guard let newBook = createBook() else { return }
        BooksAPIClient.addBook(book: newBook) {
            print("finished adding book")
           _ = self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    private func createBook() -> Book? {
        
        guard let title = titleLbl.text,
            let author = authorTxtFld.text,
            let publisher = publisherTxtFld.text,
            let url = urlTxtFld.text else { return nil } //put in an error function. 
        
        let bookDictionary = ["title" : "\(title)", "author": "\(author)", "publisher": "\(publisher)", "url": "\(url)"]
        let newBook = Book(dictionary: bookDictionary)
        return newBook
    }

    

}


