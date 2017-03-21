//
//  BookTableViewCell.swift
//  GetTheBooks
//
//  Created by Bimonaretga on 3/15/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    let store = BookDataStore.sharedInstance
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var book: Book? {
        didSet {
            if let unwrappedBook = book {
                configure(book: unwrappedBook)
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        guard let unwrappedBook = book else { return }
        configure(book: unwrappedBook)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        let urlString = book.url
        
        if let imageFromCache = self.store.imageCache.object(forKey: urlString as AnyObject) {
            DispatchQueue.main.async {
                let imagePost = imageFromCache as? UIImage ?? #imageLiteral(resourceName: "BrianStaveley")
                self.bookImage.image = imagePost
                return
            }
        }
        
        guard let url = URL(string: book.url) else { return }
        guard let data = NSData(contentsOf: url) else { return }
        guard let image = UIImage(data: data as Data) else { return }
        
        let imageToCache = image
        self.store.imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
        
        
        DispatchQueue.main.async {
            self.bookImage.image = image
        }
    }

}


