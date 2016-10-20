//
//  SwipeViewController.swift
//  dateMe
//
//  Created by Raphael Lim on 20/10/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        }

    @IBAction func settingsButton(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "editSwipeSegue", sender: self)
    }

}
