//
//  DetailViewController.swift
//  M02L06Worksheet
//
//  Created by Christopher Ching on 2018-05-07.
//  Copyright © 2018 CodeWithChris. All rights reserved.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!

    var quote: Quote?
    
    var dbRef: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dbRef = Database.database().reference()
        
        // If there's a quote, set the labels
        if quote != nil {
            
            quoteLabel.text = quote!.title
            authorLabel.text = quote!.authorName
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func likeTapped(_ sender: UIButton) {
        
        // TODO: You'll implement this method after Lesson 7
        if quote != nil {
            
            dbRef?.child("quotes/\(quote!.id!)/likes").runTransactionBlock({ (currentData) -> TransactionResult in
                
                if let currentLike = currentData.value as? Int {
                    
                    currentData.value = currentLike + 1
                }
                
                return TransactionResult.success(withValue: currentData)
            })
        }
        
    }
    
    

}
