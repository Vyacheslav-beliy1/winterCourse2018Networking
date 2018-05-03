//
//  PostsViewController.swift
//  winterCourse2018Networking
//
//  Created by Yaroslav Halivets on 5/2/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    var user: User?
    var postsArray = [Post]()

    @IBOutlet weak var postsTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postsTabelView.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: PostsTableViewCell.identifier)
        
        postsTabelView.delegate = self
        postsTabelView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PostsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTabelView.dequeueReusableCell(withIdentifier: PostsTableViewCell.identifier, for: indexPath) as! PostsTableViewCell
        cell.posts = postsArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NavigationManager.showCommentsVc(post: postsArray[indexPath.row], on: self.navigationController)
    }
    
    
}
