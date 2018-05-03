//
//  NavigationManager.swift
//  winterCourse2018Networking
//
//  Created by bws2007 on 5/3/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class NavigationManager {
    class func showPostsVC(user: User,on navigation: UINavigationController?) {
        //PostsViewControllerIdentifier
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let postVC = storyboard.instantiateViewController(withIdentifier: "PostsViewControllerIdentifier") as? PostsViewController else { return }
        postVC.user = user
        if let nav = navigation {
            navigation?.pushViewController(postVC, animated: true)
        } else {
            assert(true, "there is no navigation controller")
        }
    }

}
