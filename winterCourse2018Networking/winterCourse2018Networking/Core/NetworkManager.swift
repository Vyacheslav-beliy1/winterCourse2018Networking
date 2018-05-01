//
//  NetworkManager.swift
//  winterCourse2018Networking
//
//  Created by bws2007 on 3/24/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

class NetworkManager/*: NSObject, URLSessionDownloadDelegate*/ {
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//        print("finished")
//    }
//
//    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
//        print("bytesWritten \(bytesWritten) totalBytesExpectedToWrite \(totalBytesExpectedToWrite)")
//    }
    
    class func getCommentsFor(postId: Int, completion: @escaping ([Comment], String?) -> Void) {
        //prepare url
        let queryItems = [URLQueryItem(name:"postId",value:"\(postId)")]
        var urlComponents = URLComponents(url: COMMENTSAPI!, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else { return }
        
        //make a request
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion([],"error = \(String(describing: error?.localizedDescription))")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                let json = data {
                
                guard let comments = try? JSONDecoder().decode([Comment].self, from: json) else { return }
                completion(comments, nil)
            }
            
            completion([],"Error: statusCode \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
            
            }.resume()
    }
    
    class func getPostsFor(userId: Int, completion: @escaping ([Post], String?) -> Void) {
        //prepare url
        let queryItems = [URLQueryItem(name:"userId",value:"\(userId)")]
        var urlComponents = URLComponents(url: POSTSAPI!, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else { return }
        
        //make a request
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error = \(String(describing: error?.localizedDescription))")
                completion([],"error = \(String(describing: error?.localizedDescription))")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                let json = data {
                
                guard let posts = try? JSONDecoder().decode([Post].self, from: json) else { return }
                completion(posts, nil)
            }
            completion([],"Error: statusCode \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
            
            }.resume()
    }
    
    class func getUsers(completion: @escaping ([User], String?) -> Void) {
        //prepare url
        guard let url = USERAPI else { return }
        
        //make a request
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error = \(String(describing: error?.localizedDescription))")
                completion([],"error = \(String(describing: error?.localizedDescription))")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                let json = data {
                
                guard let users = try? JSONDecoder().decode([User].self, from: json) else { return }
                completion(users, nil)
            }
            completion([],"Error: statusCode \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
            
            }.resume()
    }
    
    
    
    
    
    class func get(url: URL) {
        
//        guard let url = URL(string:"http://jsonplaceholder.typicode.com/posts/1") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error = \(String(describing: error?.localizedDescription))")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                let json = data {
                guard let post = try? JSONDecoder().decode(Post.self, from: json) else { return }
                print("userID = \(post.userId!), title \(post.title!)")
                
//                Storage().saveInfoToCash(data: [json], key: STORAGEPOSTAPI)
            }
            }.resume()
    }
    
//     func post() {
//        let dict = ["userId": 1, "id":12341234, "title": "Twitter i ok", "body": "I think not"] as [String: Any]
//        if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []) {
//
//
//            let url = NSURL(string: "http://jsonplaceholder.typicode.com/posts")!
//            let request = NSMutableURLRequest(url: url as URL)
//            request.httpMethod = "POST"
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.httpBody = jsonData
//
//            let task = URLSession.shared.dataTask(with: request as URLRequest){ data,response,error in
//                if error != nil{
//                    print(error?.localizedDescription)
//                    return
//                }
//
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//
//                    if let parseJSON = json {
//                        //let resultValue:String = parseJSON["success"] as! String;
//                        print("result: \(String(describing: response))")
//                        print(parseJSON)
//                    }
//                } catch let error as NSError {
//                    print(error)
//                }
//            }
//            task.resume()
//        }
//
//    }
//
//     func download() {
//        let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
//        let destinationFileUrl = documentsUrl.appendingPathComponent("downloadedFile.jpg")
//
//        let fileURL = URL(string: "https://www.w3schools.com/css/img_lights.jpg")
//
//
//        let sessionConfig = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: OperationQueue.main)
//
//        let request = URLRequest(url:fileURL!)
//
//        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
//            if let tempLocalUrl = tempLocalUrl, error == nil {
//                // Success
//                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
//                    print("Successfully downloaded. Status code: \(statusCode)")
//                }
//
//                do {
//                    try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
//                } catch (let writeError) {
//                    print("Error creating a file \(destinationFileUrl) : \(writeError)")
//                }
//
//            } else {
//                print("Error took place while downloading a file. Error description: %@", error?.localizedDescription);
//            }
//        }
//        task.resume()
//
//    }
}
