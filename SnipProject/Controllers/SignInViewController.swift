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

        setUp()
        
    }
    
    func setUp() {
        navigationController?.isNavigationBarHidden = false
        title = "log in".uppercased()
        
        facebookSigninBtn.layer.cornerRadius = 20
        
        borderBottom(txtField: emailTxt)
        borderBottom(txtField: passwordTxt)
        
        initializeHideKeyboard()
    }
    


}


extension  SignInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        
      
        if textField == passwordTxt{
            textField.isSecureTextEntry = true
//            if textField.text?.count ?? 0 <= 6 {
//                textField.backgroundColor = UIColor.red
//            }
            return true
        } else {
            return false
        }
         
    }
 
}
