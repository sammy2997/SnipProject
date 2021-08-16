//
//  HomeViewController.swift
//  SnipProject
//
//  Created by King on 30/07/2021.
//

import UIKit

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    @IBOutlet weak var uploadBtn: UIBarButtonItem!
    
    let db = Firestore.firestore()
    
    @IBOutlet var table: UITableView!

    var models = [DiyPosts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// register tableview Cell
        table.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)

        /// assign delegate to self and datasource
        table.delegate = self
        table.dataSource = self
        
        db.collectionGroup("posts").getDocuments { (snapshot, error) in


            //        }
//        docRef.getDocument { snapshot, error in
//            guard let data = snapshot?.data(), error == nil else{
//                return
//            }

            if let err = error {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in snapshot!.documents {
                                let fr = document.data()
                                let author = fr["author"]
                                let image = fr["pathToImage"]
                                let likes = fr["likes"]
                                let userImg = fr["userImage"]

                                DispatchQueue.main.async {
                                    self.models.append(DiyPosts(numberOfLikes: likes as! Int, username: author as! String, userImageName: userImg as! String, postImageName: image as! String))
                                    
                                    print(self.models)
                                    self.table.reloadData()
                                }
                                
                                print("\(document.documentID) => \(document.data())")
                            }
                        }

        }
        
        
        /// create a couple models to test. append new diyPosts to array of models.
//        models.append(DiyPosts(numberOfLikes: 200, username: "zuky", userImageName: "head", postImageName: "post1"))
//        models.append(DiyPosts(numberOfLikes: 500, username: "@cathy", userImageName: "head", postImageName: "post2"))
//        models.append(DiyPosts(numberOfLikes: 2000, username: "diyKings", userImageName: "head", postImageName: "post3"))
//        models.append(DiyPosts(numberOfLikes: 67220, username: "homeAlone", userImageName: "head", postImageName: "post4"))
//        models.append(DiyPosts(numberOfLikes: 659, username: "clothingbrandon", userImageName: "head", postImageName: "post5"))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//
//        ref.child("posts").observe(DataEventType.value, with: { snapshot in
//            guard let value = snapshot.value as? [String: Any] else {
//                return
//            }
//            print(value as Any)
//          })
    }

    
    func loadPosts(){
//        let defaults = UserDefaults.standard
//
//                Service.getUserInfo(onSuccess: {
//                    self.welcomeInLabel.text = "Welcome in \(defaults.string(forKey: "userNameKey")!)"
//                }) { (error) in
//                    self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
//                }
        
//        var refHandle = postRef.observe(DataEventType.value, with: { snapshot in
//          // ...
//        })
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

