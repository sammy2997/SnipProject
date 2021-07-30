//
//  AgeGenderViewController.swift
//  SnipProject
//
//  Created by King on 27/07/2021.
//

import UIKit

class AgeGenderViewController: UIViewController {
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var genderTxt: UITextField!
    @IBOutlet weak var ageBtn: UIButton!
    @IBOutlet weak var genderBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    func setUp(){
        title = "Age & Gender".uppercased()
        
        ageBtn.layer.cornerRadius = 20
        genderBtn.layer.cornerRadius = 20
        skipBtn.layer.cornerRadius = 20
    }
    
    @IBAction func inputAgeBtn(_ sender: Any) {
    }
    @IBAction func inputGenderBtn(_ sender: Any) {
    }
    @IBAction func skipBtn(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "DIYViewController") as! DIYViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
