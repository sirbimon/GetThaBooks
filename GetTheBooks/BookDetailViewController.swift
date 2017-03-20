//
//  ViewController.swift
//  GetTheBooks
//
//  Created by Bimonaretga on 3/14/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    let currentDate = NSDate()
    var book: Book? = nil
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CheckoutBttn(_ sender: Any) {
        
        print(currentDate)
    }

}

