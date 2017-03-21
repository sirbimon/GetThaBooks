//
//  ViewController.swift
//  GetTheBooks
//
//  Created by Bimonaretga on 3/14/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//
/*
 properties:
 1.UIlables
 2.currentDate: NSDate
 3.book: Book
 functionalities:
 1.view did load
 2.view did appear
 3.IBaction: chcekoutbttn
 4.segue
 5.format date !!
 6.display alert !!
*/

import UIKit

class BookDetailViewController: UIViewController  {
    
    let currentDate = NSDate()
    var book: Book!
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    @IBOutlet weak var lastCheckdOutLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let unwrappedBook = book {
            BooksAPIClient.getTheBook(book: unwrappedBook, completion: { (returnedBook) in
                DispatchQueue.main.async {
                    self.bookTitle.text = returnedBook.title
                    self.bookAuthorLabel.text = returnedBook.author
                    self.bookPublisherLabel.text = returnedBook.publisher
                }

            })
        }
    }

    @IBAction func CheckoutBttn(_ sender: Any) {
        
        displayAlert(message: "Insert Name Below")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditCurrentBookVC" {
            let dest = segue.destination as! EditBookViewController
            print("segue initiated")
            if let unwrappedBook = book {
                print("time to change book")
                dest.book = unwrappedBook
            }
            
        }
    }
    
    
    func displayAlert(message: String) {
        let alert = UIAlertController(title: "Check This Book Out", message: message, preferredStyle: .alert)
        alert.addTextField { _ in }
        
        let insertNameAction = UIAlertAction(title: "checkout book", style: .default) { (action) in
            
            guard let text = alert.textFields?.first?.text, text != ""
                else { return }
            
            self.book.bookCheckedOut(name: text)
            
            BooksAPIClient.checkoutBook(self.book, completion: { _ in
                
                self.dismiss(animated: true, completion: nil)

            })
            
            
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (action) in
            
        }
        
        alert.addAction(insertNameAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

}
