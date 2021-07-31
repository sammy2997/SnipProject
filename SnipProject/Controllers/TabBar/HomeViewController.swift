//
//  HomeViewController.swift
//  SnipProject
//
//  Created by King on 30/07/2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onclickPush() {
        let vc = UIViewController()
        vc.view.backgroundColor = .purple
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
