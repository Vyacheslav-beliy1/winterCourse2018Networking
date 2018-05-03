//
//  UserTableViewCell.swift
//  winterCourse2018Networking
//
//  Created by Yaroslav Halivets on 5/1/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCellIdentifier"
    
    var user : User? {
        didSet {
            guard let currentUser = user else {return}
            self.nameLabel.text = currentUser.name
            self.userNameLabel.text = currentUser.username
            self.phoneLabel.text = currentUser.phone
            self.companyLabel.text = currentUser.company?.name
        }
    }
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
