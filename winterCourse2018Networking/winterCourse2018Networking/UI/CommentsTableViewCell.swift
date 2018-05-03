//
//  CommentsTableViewCell.swift
//  winterCourse2018Networking
//
//  Created by Yaroslav Halivets on 5/2/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    
    static let idetifier = "CommentsTableViewCellIdentifier"
    
    var comments : Comment?{
        didSet{
              guard let currentComments = comments else {return}
            self.nameCommentLabel.text = currentComments.name
            self.bodyCommentLabel.text = currentComments.body
            self.emailLabel.text = currentComments.email
        }
    }
    @IBOutlet weak var nameCommentLabel: UILabel!
    
    @IBOutlet weak var bodyCommentLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
