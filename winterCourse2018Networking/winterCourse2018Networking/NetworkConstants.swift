//
//  NetworkConstants.swift
//  winterCourse2018Networking
//
//  Created by bws2007 on 3/17/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

var server = URL(string:"http://jsonplaceholder.typicode.com")
let postApi = server?.appendPathComponent("/posts")
let userApi = server?.appendPathComponent("/users")
