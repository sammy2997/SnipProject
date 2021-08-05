//
//  HomeViewController.swift
//  SnipProject
//
//  Created by King on 30/07/2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var table: UITableView!

    var models = [DiyPosts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// register tableview Cell
        table.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)

        /// assign delegate to self and datasource
        table.delegate = self
        table.dataSource = self
        
        /// create a couple models to test. append new diyPosts to array of models.
        models.append(DiyPosts(numberOfLikes: 200, username: "zuky", userImageName: "head", postImageName: "post1"))
        models.append(DiyPosts(numberOfLikes: 500, username: "@cathy", userImageName: "head", postImageName: "post2"))
        models.append(DiyPosts(numberOfLikes: 2000, username: "diyKings", userImageName: "head", postImageName: "post3"))
        models.append(DiyPosts(numberOfLikes: 67220, username: "homeAlone", userImageName: "head", postImageName: "post4"))
        models.append(DiyPosts(numberOfLikes: 659, username: "clothingbrandon", userImageName: "head", postImageName: "post5"))
        
    }
    
    @IBAction func onclickPush() {
        let vc = UIViewController()
        vc.view.backgroundColor = .purple
        
        navigationController?.pushViewController(vc, animated: true)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.configure(with: models[indexPath.row])
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        /// return custom width that is height of top and bottom container + width of screen for image which is square so is same as height
        return 80 + 110 + view.frame.size.width
//        return 500
        
//        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

/// struct for posts on page
struct DiyPosts {
    let numberOfLikes: Int
    let username: String
    let userImageName: String
    let postImageName: String
}
