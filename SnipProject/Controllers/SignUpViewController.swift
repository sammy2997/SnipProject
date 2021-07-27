//
//  SignUpViewController.swift
//  SnipProject
//
//  Created by King on 27/07/2021.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Sign Up"
        
        signUpBtn.layer.cornerRadius = 20
        facebookBtn.layer.cornerRadius = 20
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
    }
    
    @IBAction func facebookBtn(_ sender: Any) {
    }
    
}
