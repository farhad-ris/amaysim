//
//  Services.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import Foundation

class Services {
    
    var id:                                 String!
    var MSN:                                String!
    var credit:                             Int!
    var creditExpiryDate:                   Date!
    var isDataUsageThreshold:               Bool!
    var relatedSubscriptions:               [Subscriptions]?
    var URL:                                String?
    
    
    init(id: String!, MSN: String!, credit: Int?, creditExpiryDate: Date?, isDataUsageThreshold: Bool? = false, URL: String?) {
        
        self.id =                               id
        self.MSN =                              MSN
        self.credit =                           credit
        self.creditExpiryDate =                 creditExpiryDate
        self.isDataUsageThreshold =             isDataUsageThreshold
        self.URL =                              URL
        self.relatedSubscriptions =             []
    }
}
