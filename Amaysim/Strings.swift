//
//  Strings.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import Foundation

extension String {
     var AMDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter.date(from: self)
    }
    
    var convertToDictionary: [String:Any]? {
        
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
            } catch let error as NSError {
                print("there is something wrong with this json \(error)")
                return nil
            }
        }
        return nil
    }
}
