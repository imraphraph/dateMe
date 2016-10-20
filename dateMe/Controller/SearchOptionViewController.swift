//
//  SearchOptionViewController.swift
//  dateMe
//
//  Created by Raphael Lim on 20/10/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

import UIKit

class SearchOptionViewController: UIViewController {
    
    @IBOutlet weak var ageOutlet: UILabel!
    @IBOutlet weak var genderOutlet: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func genderAction(_ sender: AnyObject) {
    }
    
    @IBAction func sliderAction(_ sender: AnyObject) {
    }
    
    @IBAction func saveButton(_ sender: AnyObject) {
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
