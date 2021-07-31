//
//  ExperienceViewController.swift
//  SnipProject
//
//  Created by King on 30/07/2021.
//

import UIKit

class ExperienceViewController: UIViewController {

    @IBOutlet weak var beginBtn: UIButton!
    @IBOutlet weak var intermediateBtn: UIButton!
    @IBOutlet weak var expertBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var lblBorder: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    func setUp(){
//        title = "Age & Gender".uppercased()
        navigationController?.isNavigationBarHidden = true

        
        beginBtn.layer.cornerRadius = 20
        intermediateBtn.layer.cornerRadius = 20
        expertBtn.layer.cornerRadius = 20
        borderBottom(txtField: lblBorder)
        
        /// allow you to show and dimiss keyboard on button tap
        initializeHideKeyboard()
    }
    
    @IBAction func onClickSkip(_ sender: Any) {
//        let st = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = st.instantiateViewController(withIdentifier: "LoadingViewController") as! LoadingViewController
//
//        navigationController?.pushViewController(vc, animated: true)
        
        /// instantiate tab bar controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            
        /// This is to get the SceneDelegate object from your view controller
        /// then call the change root view controller function to change to main tab bar
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func onClickBegin(_ sender: Any) {
    }
    
    @IBAction func onClickIntermediate(_ sender: Any) {
    }
    
    @IBAction func onClickExpert(_ sender: Any) {
    }
    

    

}
