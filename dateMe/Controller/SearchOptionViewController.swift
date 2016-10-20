//
//  SearchOptionViewController.swift
//  dateMe
//
//  Created by Raphael Lim on 20/10/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SearchOptionViewController: UIViewController {
    
    @IBOutlet weak var ageOutlet: UILabel!
    @IBOutlet weak var genderOutlet: UISegmentedControl!

    var gender : String = ""
    
    var fireBaseRef = FIRDatabase.database().reference()

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func genderAction(_ sender: AnyObject) {
        if genderOutlet.selectedSegmentIndex == 0 {
            self.gender = "male" 
        }
        if genderOutlet.selectedSegmentIndex == 1{
            self.gender = "female" 
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        let selectedValue = Int(sender.value)
        
        ageOutlet.text = String(stringInterpolationSegment: selectedValue)
    }
    
    @IBAction func saveButton(_ sender: AnyObject) {
        
        let genderSearch = self.gender
        let ageSearch = ageOutlet.text
        let userDictionary = ["GenderSearch": genderSearch, "AgeSearch": ageSearch]
        self.fireBaseRef.child("users").child(Session.currentUserUid).child("SearchOption").updateChildValues(userDictionary)
    
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
