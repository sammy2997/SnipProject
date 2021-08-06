//
//  ViewController.swift
//  SnipProject
//
//  Created by King on 26/07/2021.
//

import UIKit
/// STEP 4 - import notifications to both app Delegate and main view Controller
import UserNotifications

class StartUpViewController: UIViewController {
    
    
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// STEP 5- For notifications
        UNUserNotificationCenter.current().delegate = self;
        
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setUp(){
        
        signUpBtn.layer.cornerRadius = 20
        signUpBtn.backgroundColor = .blue
        
        loginBtn.layer.cornerRadius = 20
        loginBtn.backgroundColor = .clear
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(identifier: "SignInViewController") as! SignInViewController

        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

/// continued STEP 5 -  add to deal with the notification while app is in foreground
extension StartUpViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print(notification.request.content.body);
        completionHandler([.alert, .sound])
        
    }
}

