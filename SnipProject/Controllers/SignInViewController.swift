//
//  SignInViewController.swift
//  SnipProject
//
//  Created by King on 27/07/2021.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signinBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Log In"
        
        signinBtn.layer.cornerRadius = 20
    }
    


}
