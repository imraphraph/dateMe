//
//  SwipeViewController.swift
//  dateMe
//
//  Created by Raphael Lim on 20/10/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {
    
    var allUsers = [String:User]()
    
    var draggableViewBackground: dateMeViewBackground!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        loadUser()
        self.draggableViewBackground = dateMeViewBackground(frame:self.view.frame)
        self.view.addSubview(self.draggableViewBackground)

    }
    
    func loadUser() {
        
        DataService.userRef.observe(.childAdded, with: { (snapshot) in
            if let user1 = User.init(snapshot: snapshot){
                self.allUsers[user1.username] = user1
                if user1.userUID != Session.currentUserUid {
                    self.draggableViewBackground.addToExampleCardLabels(user: user1)
                }
            }
        })
    }
    

    @IBAction func settingsButton(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "editSwipeSegue", sender: self)
        
    }


}
