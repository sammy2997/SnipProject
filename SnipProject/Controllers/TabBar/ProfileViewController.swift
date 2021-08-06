//
//  ProfileViewController.swift
//  SnipProject
//
//  Created by King on 30/07/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var signOutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        
        let nvViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.NavViewController)
        
        /// swap out rootVC  and assign it to home
        view.window?.rootViewController = nvViewController
        view.window?.makeKeyAndVisible()
    }
    

}
