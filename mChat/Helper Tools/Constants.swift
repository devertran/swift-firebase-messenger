//
//  Constants.swift
//  mChat
//
//  Created by Vitaliy Paliy on 11/17/19.
//  Copyright © 2019 PALIY. All rights reserved.
//

import UIKit
import Firebase

class Constants {
    
    static let db = Database.database()
    
    struct Colors {
        static let appColor = UIColor(displayP3Red: 71/255, green: 94/255, blue: 208/255, alpha: 1)
    }
    
    static func activityObservers(isOnline: Bool){
        guard let user = Auth.auth().currentUser else { return }
        let ref = Database.database().reference()
        let userRef = ref.child("users").child(user.uid)
        userRef.child("isOnline").setValue(isOnline)
        userRef.child("lastLogin").setValue(Date().timeIntervalSince1970)
    }
    
    
}
