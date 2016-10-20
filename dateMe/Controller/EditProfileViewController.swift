//
//  EditProfileViewController.swift
//  dateMe
//
//  Created by Raphael Lim on 20/10/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class EditProfileViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

 
    @IBOutlet weak var genderTextField: UITextField!

    @IBOutlet weak var ageIndicator: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    var gender : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.delegate = self
        
        retrieveProfileImage()
        loadUserData()
        
        profileImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectProfileImage)))
        profileImage.isUserInteractionEnabled = true

        
    }
    
    func dismissKeyboard() {
        usernameTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    func loadUserData () {
    
        DataService.userRef.child(Session.currentUserUid).observe(.value, with: { (snapshot) in
            let userDictionary: [String: AnyObject]? = snapshot.value as? [String: AnyObject]
            if let username = userDictionary?["username"] as? String{
                self.usernameTextField.text = username
            }
            if let genderLoad = userDictionary?["gender"] as? String{
                self.genderTextField.text = genderLoad
            }
            if let age = userDictionary?["age"] as? String{
                self.ageIndicator.text = age
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
    
    func selectProfileImage () {
        let picker = UIImagePickerController ()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker : UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            
            // set the profile image
            profileImage.image = selectedImage
            let storageRef = FIRStorage.storage().reference()
            let userRef = storageRef.child("profilePicture").child(Session.currentUserUid)
            
            if let uploadData = UIImageJPEGRepresentation(selectedImage, 0.7) {
                
                userRef.put(uploadData, metadata: nil, completion: { (metadata, error) in
                    
                    if error != nil{
                        print(error)
                        return
                    } else {
                        if let imageURL = metadata?.downloadURLs?.first {
                            FIRDatabase.database().reference().child("users").child(Session.currentUserUid).child("profilePicture").setValue(imageURL.absoluteString)
                            
                        }
                    }
                })
                
            }
            
        }
        
        dismiss(animated: true, completion: nil)
    }


    


    
    @IBAction func ageAction(_ sender: UISlider) {
        
        let selectedValue = Int(sender.value)
        
        ageIndicator.text = String(stringInterpolationSegment: selectedValue)
        
    }

    @IBAction func saveButton(_ sender: AnyObject) {
    }
   
    @IBAction func backButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}
