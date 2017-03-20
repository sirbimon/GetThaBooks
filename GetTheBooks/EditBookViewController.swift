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

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let title = titleTxtFld.text,
            let author = authorTxtFld.text,
            let publisher = publisherTxtFld.text,
            let url = urlTxtFld.text else { return }
        
        titleTxtFld.placeholder = "\(title)..."
        authorTxtFld.placeholder = "\(author)..."
        publisherTxtFld.placeholder = "\(publisher)..."
        urlTxtFld.placeholder = "\(url)..."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension EditBookViewController {
    
}
