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
    var phone : String?
    var website : String?
    var company : UserCompany?

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
         company = try values.decode(UserCompany.self, forKey: .company)
        address = try values.decode(UserAddress.self, forKey: .address)
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        username = try values.decode(String.self, forKey: .username)
        email = try values.decode(String.self, forKey: .email)
        phone = try values.decode(String.self, forKey: .phone)
        website = try values.decode(String.self, forKey: .website)
    }
}

class UserCompany : Codable {
    var name : String?
    var catchPhrase : String?
    var bs : String?
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        catchPhrase = try values.decode(String.self, forKey: .catchPhrase)
        bs = try values.decode(String.self, forKey: .bs)
        
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

