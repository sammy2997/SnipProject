//
//  ProfileViewController.swift
//  SnipProject
//
//  Created by King on 30/07/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var followersLbl: UILabel!
    @IBOutlet weak var followingLbl: UILabel!
    @IBOutlet weak var goalsLbl: UILabel!
    
    @IBOutlet weak var scrollViewSection: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
