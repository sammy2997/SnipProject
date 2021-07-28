//
//  SignInViewController.swift
//  SnipProject
//
//  Created by King on 27/07/2021.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var facebookSigninBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Log In"
        
        facebookSigninBtn.layer.cornerRadius = 20
    }
    


}
