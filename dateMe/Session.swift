//
//  Session.swift
//  dateMe
//
//  Created by Raphael Lim on 20/10/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

import Foundation
import Firebase

open class Session{
    
    static let sessionKey = "sessionUID"
    static var singleton:Session?
    
    static func storeUserSession() {
        if let user = FIRAuth.auth()!.currentUser{
            UserDefaults.standard.set(user.uid, forKey: Session.sessionKey)
        }
    }
    
    static func isUserLoggedIn() -> Bool {
        if let _ = UserDefaults.standard.object(forKey: Session.sessionKey) as? String{
            return true
        } else {
            return false
        }
    }
    
    static var currentUserUid:  String {
        
        if let user = FIRAuth.auth()!.currentUser{
            return user.uid
        }
        
        return (UserDefaults.standard.object(forKey: Session.sessionKey) as? String)!
    }
    
    func removeUserSession() {
        UserDefaults.standard.removeObject(forKey: Session.sessionKey)
    }
    
    static var getSingleton: Session {
        if singleton == nil{
            singleton = Session()
        }
        return singleton!
    }
    
}
