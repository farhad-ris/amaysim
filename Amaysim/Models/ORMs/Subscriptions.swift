//
//  Subscriptions.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import Foundation

class Subscriptions {
    
    var id:                                                 String!
    var includedDataBalance:                                Int?
    var includedCreditBalance:                              Int?
    var includedRolloverDataBalance:                        Int?
    var includedRolloverCreditBalance:                      Int?
    var includedInternationalTalkBalance:                   Int?
    var expiryDate:                                         Date!
    var isAutoRenewal:                                      Bool!
    var isPrimarySubscription:                              Bool!
    var relatedProducts:                                    [Products]?
    var URL:                                                String?
    
    
    init(id: String!, includedDataBalance: Int?, includedCreditBalance: Int?, includedRolloverDataBalance: Int?, includedRolloverCreditBalance: Int?, includedInternationalTalkBalance: Int?, expiryDate: Date!, isAutoRenewal: Bool? = false, isPrimarySubscription: Bool? = false, URL: String?) {
        
        self.id =                                                   id
        self.includedDataBalance =                                  includedDataBalance
        self.includedCreditBalance =                                includedCreditBalance
        self.includedRolloverDataBalance =                          includedRolloverDataBalance
        self.includedRolloverCreditBalance =                        includedRolloverCreditBalance
        self.includedInternationalTalkBalance =                     includedInternationalTalkBalance
        self.expiryDate =                                           expiryDate
        self.isAutoRenewal =                                        isAutoRenewal
        self.isPrimarySubscription =                                isPrimarySubscription
        self.URL =                                                  URL
    }
    
    
    init(id: String!, includedDataBalance: Int?, expiryDate: Date!, isAutoRenewal: Bool? = false, isPrimarySubscription: Bool? = false, URL: String?) {
        
        self.id =                                                   id
        self.includedDataBalance =                                  includedDataBalance
        self.expiryDate =                                           expiryDate
        self.isAutoRenewal =                                        isAutoRenewal
        self.isPrimarySubscription =                                isPrimarySubscription
        self.URL =                                                  URL
        self.relatedProducts =                                      []
    }
}
