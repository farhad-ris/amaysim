//
//  Randomizer.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 18/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import Foundation
import UIKit



func randomText(length: Int, justLowerCase: Bool = false) -> String {
    var text = ""
    for _ in 1...length {
        var decValue =          0  // ascii decimal value of a character
        var charType =          3  // default is lowercase
        if justLowerCase == false {
            // randomize the character type
            charType =          Int(arc4random_uniform(4))
        }
        switch charType {
        case 1:  // digit: random Int between 48 and 57
            decValue =          Int(arc4random_uniform(10)) + 48
        case 2:  // uppercase letter
            decValue =          Int(arc4random_uniform(26)) + 65
        case 3:  // lowercase letter
            decValue =          Int(arc4random_uniform(26)) + 97
        default:  // space character
            decValue =          32
        }
        // get ASCII character from random decimal value
        let char =              String(describing: UnicodeScalar(decValue)!)
        text = text + char
        // remove double spaces
        text =                  text.replacingOccurrences(of: "  ", with: " ")
    }
    return text
}


func randomEmail() -> String {
    let nameLength =                            randomInt(from: 5, to: 10)
    let domainLength =                          randomInt(from: 5, to: 10)
    let domainSuffixes =                        ["com", "net", "org", "io", "co.uk"]
    let name =                                  randomText(length: nameLength, justLowerCase: true)
    let domain =                                randomText(length: domainLength, justLowerCase: true)
    let randomDomainSuffixIndex =               Int(arc4random_uniform(UInt32(domainSuffixes.count)))
    let domainSuffix =                          domainSuffixes[randomDomainSuffixIndex]
    let text =                                  name + "@" + domain + "." + domainSuffix
    return text
}

func randomString(length: Int) -> String {
    
    let letters :                   NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let len =                       UInt32(letters.length)
    
    var randomString = ""
    
    for _ in 0 ..< length {
        let rand =              arc4random_uniform(len)
        var nextChar =          letters.character(at: Int(rand))
        randomString +=         NSString(characters: &nextChar, length: 1) as String
    }
    
    return randomString
}

func randomColor() -> UIColor{
    let red =           CGFloat(drand48())
    let green =         CGFloat(drand48())
    let blue =          CGFloat(drand48())
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
}

func randomInt(from: Int, to: Int) -> Int {
    let range =         UInt32(to - from)
    let rndInt =        Int(arc4random_uniform(range + 1)) + from
    return rndInt
}

func randomBool() -> Bool {
    return arc4random_uniform(2) == 0
}

func randomDate() -> Date {
    return Date.init(timeIntervalSince1970:  TimeInterval(randomInt(from: 61171100, to: 611712000 * 2)))
}
