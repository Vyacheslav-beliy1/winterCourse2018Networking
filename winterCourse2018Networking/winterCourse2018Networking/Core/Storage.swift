//
//  Storage.swift
//  winterCourse2018Networking
//
//  Created by bws2007 on 3/24/18.
//  Copyright © 2018 bws2007. All rights reserved.
//

import Foundation

class Storage {
    
    let storage = UserDefaults.standard
    
    func getInfoFromCash(key: String) -> Any? {
        return storage.object(forKey: key)
    }
    
    func saveInfoToCash(data: Data, key: String) {
        if let value = getInfoFromCash(key: key) {
            if var arr = value as? Array<Data> {
                arr.append(data)
                storage.set(arr, forKey: key)
            } else {
                storage.set(data, forKey: key)
            }
        } else {
            storage.set(data, forKey: key)
        }
    }
    
    func saveInfoToCash(data: [Data], key: String) {
            storage.set(data, forKey: key)
    }
}
