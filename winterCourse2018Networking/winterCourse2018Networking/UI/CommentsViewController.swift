//
//  CommentsViewController.swift
//  winterCourse2018Networking
//
//  Created by Yaroslav Halivets on 5/2/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    var post  : Post?
    var commentsArray = [Comment]()
    @IBOutlet weak var commentsTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.commentsTabelView.register(UINib(nibName: "CommentsTableViewCell", bundle: nil), forCellReuseIdentifier: CommentsTableViewCell.idetifier)
        
        commentsTabelView.delegate = self
        commentsTabelView.dataSource = self
        
        if let id = post?.id {
            NetworkManager.getCommentsFor(postId: id) { (downloadedComments, textError) in
                DispatchQueue.main.async {
                    if let error = textError {
                        //allert
                    } else{
                        self.commentsArray = downloadedComments
                        self.commentsTabelView.reloadData()
                    }
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
extension CommentsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentsTabelView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.idetifier, for: indexPath) as! CommentsTableViewCell
        cell.comments = commentsArray[indexPath.row]
        return cell
    }
    
    
}
