//
//  aboutMeViewController.swift
//  dateMe
//
//  Created by Raphael Lim on 20/10/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

import UIKit

class aboutMeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var descriptionTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    @IBAction func saveButton(_ sender: AnyObject) {
    }
   

    @IBAction func backButton(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
