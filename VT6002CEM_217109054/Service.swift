//
//  Service.swift
//  VT6002CEM_217109054
//
//  Created by User on 4/1/2022.
//

import Foundation
import UIKit
import Firebase

class Service {
    static func getUserInfo(onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void){
     let ref = Database.database().reference()
     let defaults = UserDefaults.standard
     
     guard let uid = Auth.auth().currentUser?.uid else {
     print("User not found")
     return
     }
     
     ref.child("users").child(uid).observe(.value, with: { (snapshot) in
      if let dictionary = snapshot.value as? [String : Any] {
         let email = dictionary["email"] as! String
         let name = dictionary["name"] as! String
         
         defaults.set(email, forKey: "userEmailKey")
         defaults.set(name, forKey: "userNameKey")
         
         onSuccess()
         }
         }){ (error) in
            onError(error)
            }
            }
    
    static func createAlertController(title: String, message: String)-> UIAlertController {
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) {(action) in
            alert.dismiss(animated: true, completion:nil)
            }
            
            alert.addAction(okAction)
            
            return alert
            }
            }
