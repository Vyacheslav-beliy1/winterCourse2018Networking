//
//  Users.swift
//  winterCourse2018Networking
//
//  Created by Yaroslav Halivets on 5/1/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation
class User: Codable {
    var address: UserAddress?
    var  id : Int?
    var name : String?
    var username : String?
    var email : String?

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address = try values.decode(UserAddress.self, forKey: .address)
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        username = try values.decode(String.self, forKey: .username)
        email = try values.decode(String.self, forKey: .email)
    }
}

class UserAddress : Codable{
    var geo: UserGeo?
    var street : String?
    var suite : String?
    var city : String?
    var zipcode : String?
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
              geo = try values.decode(UserGeo.self, forKey: .geo)
        street = try values.decode(String.self, forKey: .street)
        suite = try values.decode(String.self, forKey: .suite)
        city = try values.decode(String.self, forKey: .street)
        zipcode = try values.decode(String.self, forKey: .zipcode)
   
    }
}

class UserGeo  :Codable{
   var lat: String?
    var lng :String?
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
       lat = try values.decode(String.self, forKey: .lat)
        lng = try values.decode(String.self, forKey: .lng)
    }
}

