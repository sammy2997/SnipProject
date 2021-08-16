//
//  Service.swift
//  SnipProject
//
//  Created by King on 07/08/2021.
//


import UIKit
import Firebase
import FirebaseDatabase

class Service {
    
//    static func signUpUser(email: String, password: String, name: String, onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
//        let auth = Auth.auth()
//
//        auth.createUser(withEmail: email, password: password) { (authResult, error) in
//            if error != nil {
//                onError(error!)
//                return
//            }
//
//            uploadToDatabase(email: email, name: name, onSuccess: onSuccess)
//        }
//    }
//
//    static func uploadToDatabase(email: String, name: String, onSuccess: @escaping () -> Void) {
//        let ref = Database.database().reference()
//        let uid = Auth.auth().currentUser?.uid
//
//        ref.child("users").child(uid!).setValue(["email" : email, "name" : name])
//        onSuccess()
//    }
    
    static func getUserInfo(onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        let ref = Database.database().reference()
        let defaults = UserDefaults.standard
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User not found")
            return
        }
        
        ref.child("users").child(uid).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : Any] {
                let firstname = dictionary["firstname"] as! String
                let lastname = dictionary["lastname"] as! String
                
                defaults.set(firstname, forKey: "userEmailKey")
                defaults.set(lastname, forKey: "userNameKey")
                
                onSuccess()
            }
        }) { (error) in
            onError(error)
        }
    }
    
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }

        alert.addAction(okAction)

        return alert
    }
}
