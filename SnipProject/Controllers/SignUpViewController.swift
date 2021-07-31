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

        setUp()
    }
    
    func setUp(){
        navigationController?.isNavigationBarHidden = false
        title = "Sign Up".uppercased()
        
        signUpBtn.layer.cornerRadius = 20
        facebookBtn.layer.cornerRadius = 20
        
        /// adds bottom border to textfield through extension of vc
        borderBottom(txtField: firstNameTxt)
        borderBottom(txtField: lastNameTxt)
        borderBottom(txtField: emailTxt)
        borderBottom(txtField: passwordTxt)
        
        /// allow you to show and dimiss keyboard on button tap
        initializeHideKeyboard()
        
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "AgeGenderViewController") as! AgeGenderViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func facebookBtn(_ sender: Any) {
    }
    
}

extension  SignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
       
        let val  = Int(string)
        
        if val != nil {
            if textField == firstNameTxt && textField == lastNameTxt {
                textField.backgroundColor = UIColor.lightGray
            } else {
                textField.backgroundColor = .clear
            }
            return false
        } else {
            return true
        }
      
    }
}
