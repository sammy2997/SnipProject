//
//  SignUpViewController.swift
//  SnipProject
//
//  Created by King on 27/07/2021.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {
 

    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    // MARK: Properties
    /// observers that let you monitor a user’s authentication state.
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        guard let handle = handle else { return }
//        Auth.auth().removeStateDidChangeListener(handle)
//    }
    
    func setUp(){
        navigationController?.isNavigationBarHidden = false
        title = "Sign Up".uppercased()
        
        // hide error label
        errorLbl.alpha = 0
        
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
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        // takes away whitespaces and new lines from text
        if firstNameTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure and meets criteria
        let cleanedPassword = passwordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    @IBAction func signUpBtn(_ sender: Any) {

        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data to be able to add to firestore after validating fields.
            let firstName = firstNameTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user using email and password provided
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    // reference to firestore object.
                    let db = Firestore.firestore()
                    
                    // use firestore reference to specify collection to add document to(users). call add document to pass dictionary containing all keyvalue pairs you want to collection. Below we add first name, last name and UID, extra data to compliment email and password in the Authentication store
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
                        
                        
                        // error handling from trying to add data to database.
                        if error != nil {
                            // Show error message if extra data can't be saved. account still created.
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToAgeGender()
                }
                
            }
        }
    }
    
    
    @IBAction func facebookBtn(_ sender: Any) {
    }
    
    func showError(_ message:String) {
        
        errorLbl.text = message
        errorLbl.alpha = 1
    }
    
    func transitionToAgeGender() {
//        let st = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = st.instantiateViewController(withIdentifier: "AgeGenderViewController") as! AgeGenderViewController
//
//        navigationController?.pushViewController(vc, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(identifier: "AgeGenderViewController") as! AgeGenderViewController
        
        navigationController?.pushViewController(vc, animated: true)
        
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
