//
//  PostsTableViewCell.swift
//  winterCourse2018Networking
//
//  Created by Yaroslav Halivets on 5/2/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    static let identifier = "PostsTableViewCellIdentifier"
    
    var posts : Post? {
        didSet {
             guard let currentPost = posts else {return}
            self.bodyLabel.text = currentPost.body
            self.titleLabel.text = currentPost.title
        }
    }
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
