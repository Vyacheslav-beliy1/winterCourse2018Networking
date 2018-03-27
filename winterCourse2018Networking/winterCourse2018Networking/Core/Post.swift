//
//  Post.swift
//  winterCourse2018Networking
//
//  Created by bws2007 on 3/17/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

class Post: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        body = try values.decode(String.self, forKey: .body)
        userId = try values.decode(Int.self, forKey: .userId)
        id = try values.decode(Int.self, forKey: .id)
    }
}

//class User: Codable {
//    var address: UserAddress
//    
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        address = try values.decode(UserAddress.self, forKey: .address)
//    }
//}
//
//class UserAddress: Codable {
//    var geo: UserGeo
//    
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        geo = try values.decode(UserGeo.self, forKey: .geo)
//    }
//}
//
//class UserGeo {
//    
//}

