//
//  aboutMeViewController.swift
//  dateMe
//
//  Created by Raphael Lim on 20/10/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class aboutMeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var descriptionTextField: UITextView!
    var fireBaseRef = FIRDatabase.database().reference()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionTextField.delegate = self
        
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(aboutMeViewController.dismissKeyboard)))
        
        loadUserData()
    }
    
    
    func dismissKeyboard() {
        descriptionTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    func loadUserData () {
    
        DataService.userRef.child(Session.currentUserUid).observe(.value, with: { (snapshot) in
            let userDictionary: [String: AnyObject]? = snapshot.value as? [String: AnyObject]
            
            if let description = userDictionary?["description"] as? String{
                self.descriptionTextField.text = description
            }
           
            
        })

    
    }


    @IBAction func saveButton(_ sender: AnyObject) {
        
        if let description = descriptionTextField.text  {
            let userDictionary = ["description" : description]
            self.fireBaseRef.child("users").child(Session.currentUserUid).updateChildValues(userDictionary)
            Session.storeUserSession()
            }
        self.dismiss(animated: true, completion: nil)

    }
   

    @IBAction func backButton(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
