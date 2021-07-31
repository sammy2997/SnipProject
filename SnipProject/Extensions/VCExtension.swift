//
//  ExtensionVC.swift
//  SnipProject
//
//  Created by King on 30/07/2021.
//

import UIKit

extension UIViewController {
    
//    @IBOutlet weak var messageTF: UITextField!
//    @IBOutlet weak var backgroundSV: UIScrollView!
    
    func borderBottom(txtField: UITextField){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: txtField.frame.height - 1, width: txtField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        txtField.borderStyle = UITextField.BorderStyle.none
        txtField.layer.addSublayer(bottomLine)
    }
    
    func initializeHideKeyboard(){
     //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
     let tap: UITapGestureRecognizer = UITapGestureRecognizer(
     target: self,
     action: #selector(dismissMyKeyboard))
     //Add this tap gesture recognizer to the parent view
     view.addGestureRecognizer(tap)
     }
    
     @objc func dismissMyKeyboard(){
     //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
     //In short- Dismiss the active keyboard.
        view.endEditing(true)
        navigationController?.isNavigationBarHidden = false
     }
    
}
