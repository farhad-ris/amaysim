//
//  Cosntants.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import Foundation

struct Constants {
    struct ServerInformation {
        static let ServerUrl = URL(string: "http://0.0.0.0:5000/json")
        static let ServerUrlFromMobile = URL(string: "http://10.0.0.67:5000/json")

}
}

struct GlobalVariables {
    struct LoginCredentioals {
        static var MSN: String?
    }
}
