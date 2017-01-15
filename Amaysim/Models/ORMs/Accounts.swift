//
//  Accounts.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import Foundation

class Accounts {
    
    var id:                             String!
    var paymentType:                    String!
    var unbilledCharges:                Int?
    var nextBillingDate:                Date?
    var title:                          String!
    var firstName:                      String!
    var lastName:                       String!
    var dateOfBirth:                    Date!
    var contactNumber:                  String!
    var email:                          String!
    var isEmailVerified:                Bool!
    var isSubscribedForEmail:           Bool!
    var relatedServices:                [Services]?
    var URL:                            String!
    
    static let sharedInstance =         Accounts()

    
     init(id: String!, paymentType: String!, title: String!, firstName: String!, lastName: String!, dateOfBirth: Date!, contactNumber: String, email: String, isEmailVerified: Bool? = false, isSubscribedForEmail: Bool? = false, URL: String!) {
        
        self.id =                                               id
        self.paymentType =                                      paymentType
        self.title =                                            title
        self.firstName =                                        firstName
        self.lastName =                                         lastName
        self.dateOfBirth =                                      dateOfBirth
        self.contactNumber =                                    contactNumber
        self.email =                                            email
        self.isEmailVerified =                                  isEmailVerified
        self.isSubscribedForEmail =                             isSubscribedForEmail
        self.URL =                                              URL
        self.relatedServices =                                  []
    }
    
    
    private init() {}
}

