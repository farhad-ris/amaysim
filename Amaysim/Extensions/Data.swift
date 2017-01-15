//
//  Data.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import Foundation

extension Data {
    
    var convertToDictionary: [String:Any]? {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: .allowFragments) as! [String:Any]
            return json
        } catch let error as NSError {
            print(error)
            return nil
        }
    }
    
    var ToDictionary: [String:Any]? {
        
        do {
            return try JSONSerialization.jsonObject(with: self, options: []) as? [String:Any]
        } catch let error as NSError {
            print(error)
            return nil
        }
    }
}

