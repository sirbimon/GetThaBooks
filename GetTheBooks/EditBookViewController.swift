//
//  EditBookViewController.swift
//  GetTheBooks
//
//  Created by Bimonaretga on 3/15/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

class EditBookViewController: UIViewController {
    
    var book: Book?
    
    @IBOutlet weak var titleTxtFld: UITextField!
    @IBOutlet weak var authorTxtFld: UITextField!
    @IBOutlet weak var publisherTxtFld: UITextField!
    @IBOutlet weak var urlTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("edit book loading")
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let title = book?.title,
            let author = book?.author,
            let publisher = book?.publisher,
            let url = book?.url else { return }
        
        titleTxtFld.placeholder = "\(title)..."
        authorTxtFld.placeholder = "\(author)..."
        publisherTxtFld.placeholder = "\(publisher)..."
        urlTxtFld.placeholder = "\(url)..."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func addBttnPressed(_ sender: Any) {
        let dict = createDictFromData()
        guard let unwrappedBook = book else { return }
        let id = "\(unwrappedBook.id)"
        BooksAPIClient.editTheBook(bookId: id, withDictionary: dict) {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    

}

extension EditBookViewController {
    
    func createDictFromData() -> [String: Any] {
        var dict: [String: Any] = [:]
        
        if titleTxtFld.text != "" {
            guard let title = titleTxtFld.text else { return dict }
            dict["title"] = "\(title)"
        }
        
        if authorTxtFld.text != "" {
            guard let author = authorTxtFld.text else { return dict }
            dict["author"] = "\(author)"
        }
        
        if publisherTxtFld.text != "" {
            guard let publisher = publisherTxtFld.text else { return dict }
            dict["publisher"] = "\(publisher)"
        }
        
        if urlTxtFld.text != "" {
            guard let url = urlTxtFld.text else { return dict }
            dict["url"] = "\(url)"
        }
        
        
        return dict
        
    }
    
}
