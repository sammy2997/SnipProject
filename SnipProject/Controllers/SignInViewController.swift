//
//  SignInViewController.swift
//  SnipProject
//
//  Created by King on 27/07/2021.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var facebookSigninBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var loadingInd: UIActivityIndicatorView!
    
    // MARK: Properties
    var handle: AuthStateDidChangeListenerHandle?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUp()
        
        self.loadingInd.stopAnimating()
        self.loadingInd.hidesWhenStopped = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { _, user in
          if user == nil {
            // do nothing- user logs in
          } else {
            /// go back to login page
            let homeVC = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabBarHomeViewController)
            
            self.view.window?.rootViewController = homeVC
            self.view.window?.makeKeyAndVisible()
            
            self.emailTxt.text = nil
            self.passwordTxt.text = nil
          }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)
      
      // removes the listener by passing the AuthStateDidChangeListenerHandle in removeStateDidChangeListener(_:).
      guard let handle = handle else { return }
      Auth.auth().removeStateDidChangeListener(handle)
    }
    
    func setUp() {
        
        navigationController?.isNavigationBarHidden = false
        title = "log in".uppercased()
        
        // hide error label
        errorLbl.alpha = 0
        
        facebookSigninBtn.layer.cornerRadius = 20
        
        borderBottom(txtField: emailTxt)
        borderBottom(txtField: passwordTxt)
        
        initializeHideKeyboard()
    }
    
    // MARK: Actions
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        self.loadingInd.startAnimating()
        
        ///check if user has 
        let auth = Auth.auth()
        
        // clear error message
        errorLbl.text = ""
      
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the text field
            let email = emailTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                // if there is an error signing in
                if error != nil {
                    // Couldn't sign in error message
                    self.loadingInd.stopAnimating()
                    self.errorLbl.text = error!.localizedDescription
                    self.errorLbl.alpha = 1
                }
                else {
                    
                    /// go to home vc
//                    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                    
                    let homeVC = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabBarHomeViewController)
                    
                    self.view.window?.rootViewController = homeVC
                    self.view.window?.makeKeyAndVisible()
                }
            }
        }
    }
    
    func showError(_ message:String) {
        
        errorLbl.text = message
        errorLbl.alpha = 1
    }
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        // takes away whitespaces and new lines from text
        if emailTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        return nil
    }

}


extension  SignInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "" {
            return true
        }
        
      
        if textField == passwordTxt{
            textField.isSecureTextEntry = true
            return true
        } else {
            return false
        }
         
    }
 
}
