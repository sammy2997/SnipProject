//
//  SignUpViewController.swift
//  SnipProject
//
//  Created by King on 27/07/2021.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
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
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "AgeGenderViewController") as! AgeGenderViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func facebookBtn(_ sender: Any) {
    }
    
}

//extension SignUpViewController: UITextFieldDelegate{
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        
//        for i in textField.text? {
//            if i > 10{
//                
//            }
//        }
//    }
//    
//}
