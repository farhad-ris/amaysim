//
//  Products.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import Foundation

class Products {
    
    var id:                                 String!
    var name:                               String!
    var includedData:                       Int?
    var includedCredit:                     Int?
    var includedInternationalTalk:          Int?
    var isUnlimitedText:                    Bool!
    var isUnlimitedTalk:                    Bool!
    var isUnlimitedInternationalText:       Bool!
    var isUnlimitedInternationalTalk:       Bool!
    var price:                              Int!
    var URL:                                String?
        
    
    init(id: String!, name: String!, includedData: Int?, includedCredit: Int?, includedInternationalTalk: Int?, isUnlimitedText: Bool? = false, isUnlimitedTalk: Bool? = false, isUnlimitedInternationalText: Bool? = false, isUnlimitedInternationalTalk: Bool? = false, price: Int!, URL: String?) {
        
        self.id =                                           id
        self.name =                                         name
        self.includedData =                                 includedData
        self.includedCredit =                               includedCredit
        self.includedInternationalTalk =                    includedInternationalTalk
        self.isUnlimitedText =                              isUnlimitedText
        self.isUnlimitedTalk =                              isUnlimitedTalk
        self.isUnlimitedInternationalText =                 isUnlimitedInternationalText
        self.isUnlimitedInternationalTalk =                 isUnlimitedInternationalTalk
        self.price =                                        price
        self.URL =                                          URL
    }
    
    
    init(id: String!, name: String!, includedData: Int?, isUnlimitedText: Bool? = false, isUnlimitedTalk: Bool? = false, isUnlimitedInternationalText: Bool? = false, isUnlimitedInternationalTalk: Bool? = false, price: Int!, URL: String? = nil) {
        
        self.id =                                           id
        self.name =                                         name
        self.includedData =                                 includedData
        self.isUnlimitedText =                              isUnlimitedText
        self.isUnlimitedTalk =                              isUnlimitedTalk
        self.isUnlimitedInternationalText =                 isUnlimitedInternationalText
        self.isUnlimitedInternationalTalk =                 isUnlimitedInternationalTalk
        self.price =                                        price
        self.URL =                                          URL
    }
}
