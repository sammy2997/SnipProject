//
//  HomeTableViewCell.swift
//  SnipProject
//
//  Created by King on 05/08/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    /// few outlets required for contents on page
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var likesLabel: UILabel!
    
    /// static property for identifier for cell
    static let identifier = "HomeTableViewCell"
    
    /// static function to return UINib. need to register cell with this function to use cell in tableView
    static func nib() -> UINib {
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    /// function to configure tableViewCell
    
    func configure(with model: DiyPosts){
        self.likesLabel.text = "\(model.numberOfLikes) Likes"
        self.usernameLabel.text = model.username
        self.userImageView.image = UIImage(named: model.userImageName)
        self.postImageView.image = UIImage(named: model.postImageName)
    }
}
