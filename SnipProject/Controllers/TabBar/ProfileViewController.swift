//
//  ProfileViewController.swift
//  SnipProject
//
//  Created by King on 30/07/2021.
//

import UIKit
import Firebase
import FirebaseDatabase

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var signOutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        guard let user = Auth.auth().currentUser else { return }
        let onlineRef = Database.database().reference(withPath: "online/\(user.uid)")
        // 2
        onlineRef.removeValue { error, _ in
          // 3
          if let error = error {
            print("Removing online failed: \(error)")
            return
          }
          // 4
          do {
            try Auth.auth().signOut()
//            self.navigationController?.popToRootViewController(animated: true)
            let nvViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.NavViewController)

            /// swap out rootVC  and assign it to home
            self.view.window?.rootViewController = nvViewController
            self.view.window?.makeKeyAndVisible()
          } catch let error {
            print("Auth sign out failed: \(error)")
          }
        }
//        let nvViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.NavViewController)
//
//        /// swap out rootVC  and assign it to home
//        view.window?.rootViewController = nvViewController
//        view.window?.makeKeyAndVisible()
    }
    

}
