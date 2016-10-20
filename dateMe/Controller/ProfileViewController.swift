//
//  ProfileViewController.swift
//  
//
//  Created by Raphael Lim on 20/10/2016.
//
//

import UIKit
import FirebaseDatabase
import SDWebImage


class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImage.layer.borderColor = UIColor.white.cgColor

        retrieveUserData()
        retrieveProfileImage()

    }

    func retrieveUserData () {
    
        DataService.userRef.child(Session.currentUserUid).observe(.value, with: { (snapshot) in
            let userDictionary: [String: AnyObject]? = snapshot.value as? [String: AnyObject]
            if let username = userDictionary?["username"] as? String{
                self.nameLabel.text = username
            }
            if let gender = userDictionary?["gender"] as? String{
                self.genderLabel.text = gender
            }
            if let description = userDictionary?["description"] as? String{
                self.descriptionLabel.text = description
            }
            if let age = userDictionary?["age"] as? String{
                self.ageLabel.text = age
            }
            
        })
    
    }

    func retrieveProfileImage () {
    
        DataService.userRef.child(Session.currentUserUid).child("profilePicture").observe(.value, with: {(snapshot) in
            
            if let profileImageLink = snapshot.value as? String {
                let profileImageUrl = NSURL(string: profileImageLink)
                self.profileImage.sd_setImage(with: profileImageUrl as URL!)
        
    
                }
            })
    }
    

    @IBAction func editButton(_ sender: AnyObject) {
        
    performSegue(withIdentifier: "editSegue", sender: self)
        
    }
 

}
