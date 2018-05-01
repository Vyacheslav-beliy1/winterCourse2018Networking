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
    var UsersArray = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.userTabelView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        
        userTabelView.delegate = self
        userTabelView.dataSource = self
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
        return UsersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = userTabelView.dequeueReusableCell(withIdentifier: "UserTabelViewInditifier", for: indexPath) as! UserTableViewCell
        return cell
    }
    
    
}
