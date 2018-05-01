//
//  Comments.swift
//  winterCourse2018Networking
//
//  Created by bws2007 on 5/1/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

class Comment: Codable {

    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        postId = try values.decode(Int.self, forKey: .postId)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        body = try values.decode(String.self, forKey: .body)
        email = try values.decode(String.self, forKey: .email)
    }
    
}
