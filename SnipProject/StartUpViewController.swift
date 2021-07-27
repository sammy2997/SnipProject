//
//  ViewController.swift
//  SnipProject
//
//  Created by King on 26/07/2021.
//

import UIKit

class StartUpViewController: UIViewController {
    
    
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        signUpBtn.layer.cornerRadius = 20
        signUpBtn.backgroundColor = .blue
        
        loginBtn.layer.cornerRadius = 20
        loginBtn.backgroundColor = .clear
    
    }
    
    


}

