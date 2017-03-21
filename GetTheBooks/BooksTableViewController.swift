//
//  BooksTableViewController.swift
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
 4.sharedInstance
 functionalities:
 1.refreshButtonPressed
 
 */

import UIKit

class BooksTableViewController: UITableViewController {
    
    let store = BookDataStore.sharedInstance
    var selectedBook: Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.populateBooks {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("reloadView")
        store.populateBooks {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookTableViewCell
        let book = store.books[indexPath.row]
        cell.book = book

        return cell
    }
    

       // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowBookDetail" {
            let dest = segue.destination as! BookDetailViewController
            if let cell = sender as? UITableViewCell {
                dest.book = store.books[(tableView.indexPath(for: cell)?.row)!]
            }
        } else if segue.identifier == "ShowAddBookVC" {
            //show add book show add book
            
        }

    }
   
    @IBAction func refreshBttnPrssd(_ sender: Any) {
        store.populateBooks {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    

}
