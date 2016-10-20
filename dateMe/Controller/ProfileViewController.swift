//
//  ProfileViewController.swift
//  
//
//  Created by Raphael Lim on 20/10/2016.
//
//

import UIKit
import FirebaseDatabase

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImage.layer.borderColor = UIColor.white.cgColor


    }


    

 

}
