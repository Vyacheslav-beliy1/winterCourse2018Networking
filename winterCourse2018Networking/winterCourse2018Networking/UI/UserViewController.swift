//
//  UserViewController.swift
//  winterCourse2018Networking
//
//  Created by Yaroslav Halivets on 5/1/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userTabelView: UITableView!
    
    var usersArray = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        self.userTabelView.register(nib, forCellReuseIdentifier: UserTableViewCell.identifier)
        
        userTabelView.delegate = self
        userTabelView.dataSource = self
        
        NetworkManager.getUsers() { (downloadedUsers, textError) in
            DispatchQueue.main.async {
                if let error = textError {
                    // TODO: show allert that something goes wrong
                } else {
                    self.usersArray = downloadedUsers
                    self.userTabelView.reloadData()
                }
                
            }
        }
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
extension UserViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        cell.user = usersArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NavigationManager.showPostsVC(user: usersArray[indexPath.row], on: self.navigationController)
    }
    
}
