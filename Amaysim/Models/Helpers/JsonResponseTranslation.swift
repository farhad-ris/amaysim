//
//  JsonResponseTranslation.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import Foundation

func AMTranslate(json: [String:Any]) -> Bool {
    
    if let account = json["data"] as? [String:Any] {
        print("data \(account)")
        if let id = account["id"] as? String, let accountAttributes = account["attributes"] as? [String:Any] {
            if let paymentType = accountAttributes["payment-type"] as? String, let title = accountAttributes["title"] as? String, let firstName = accountAttributes["first-name"] as? String, let lastName = accountAttributes["last-name"] as? String, let isVerified = accountAttributes["email-address-verified"] as? Bool, let isSubscribed = accountAttributes["email-subscription-status"] as? Bool, let contactNumber = accountAttributes["contact-number"] as? String, let links = account["links"] as? [String:Any], let email = accountAttributes["email-address"] as? String, let dob = accountAttributes["date-of-birth"] as? String {
                let theAccount =                        Accounts.sharedInstance
                theAccount.id =                         id
                theAccount.paymentType =                paymentType
                theAccount.title =                      title
                theAccount.firstName =                  firstName
                theAccount.lastName =                   lastName
                theAccount.dateOfBirth =                dob.AMDate
                theAccount.contactNumber =              contactNumber
                theAccount.email =                      email
                theAccount.isEmailVerified =            isVerified
                theAccount.isSubscribedForEmail =       isSubscribed
                theAccount.relatedServices =            []
                
                if let url = links["self"] as? String {
                    theAccount.URL = url
                    
                    if let included = json["included"] as? [[String:Any]] {
                        var product:            Products?
                        var subscription:       Subscriptions?
                        var service:            Services?
                        
                        for object in included {
                            switch object["type"] as! String {
                            case "services":
                                service =       AMTranslateServices(fromIncluded: object)
                                print("Services \(service)")
                            case "products":
                                product =       AMTranslateProducts(fromIncluded: object)
                                print("Products \(product)")
                            case "subscriptions":
                                subscription = AMTranslateSubscriptions(fromIncluded: object)
                                print("Subscriptis \(subscription)")
                            default:
                                print("Something is not working properly")
                                return false
                            }
                        }
                        if product != nil && subscription != nil {
                                subscription?.relatedProducts?.append(product!)
                            if service != nil {
                                    service?.relatedSubscriptions?.append(subscription!)
                                    theAccount.relatedServices?.append(service!)
                                print("\(theAccount)")
                                return true
                            }
                        }
                    }
                }
            }
        }
    }
    return false
}


private func AMTranslateServices(fromIncluded: [String:Any]) -> Services? {
    print(fromIncluded)
    if fromIncluded["type"] as? String == "services"{
        if let id = fromIncluded["id"] as? String {
            if let attributes = fromIncluded["attributes"] as? [String:Any]{
                if let msn = attributes["msn"] as? String{
                    if let expiry = attributes["credit-expiry"] as? String {
                        if let isThreshold = attributes["data-usage-threshold"] as? Bool {
                            if let credit = attributes["credit"] as? Int {
                                if let link = fromIncluded["links"] as? [String:Any] {
                                    GlobalVariables.LoginCredentioals.MSN = msn
                                    guard let servise = Services.init(id: id, MSN: msn, credit: Int(credit), creditExpiryDate: expiry.AMDate, isDataUsageThreshold: isThreshold, URL: link["self"] as? String) as Services? else { return nil}
                                    print("\(servise)")
                                    return servise
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return nil
}


private func AMTranslateSubscriptions(fromIncluded: [String:Any]) -> Subscriptions? {
    
    if fromIncluded["type"] as? String == "subscriptions" {
        if let id = fromIncluded["id"] as? String {
            if let attributes = fromIncluded["attributes"] as? [String:Any] {
                if let dataBalance = attributes["included-data-balance"] as? Int?{
                    if let expiry = attributes["expiry-date"] as? String {
                        if let isAutoRenewal = attributes["auto-renewal"] as? Bool{
                            if let isPrimarySubscription = attributes["primary-subscription"] as? Bool{
                                if let link = fromIncluded["links"] as? [String:Any]{
                                    guard let subscription = Subscriptions.init(id: id, includedDataBalance: dataBalance, expiryDate: expiry.AMDate, isAutoRenewal: isAutoRenewal, isPrimarySubscription: isPrimarySubscription, URL: link["self"] as? String) as Subscriptions? else{return nil}
                                    print("\(subscription)")
                                    return subscription
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return nil
}


private func AMTranslateProducts(fromIncluded: [String:Any]) -> Products? {
    
    if fromIncluded["type"] as? String == "products"{
        if let id = fromIncluded["id"] as? String{
            if let attributes = fromIncluded["attributes"] as? [String:Any] {
                if let name = attributes["name"] as? String{
                    if let includedData = (attributes["included-data"] as? Int?) ?? 0{
                        if let isUnlimitedText = attributes["unlimited-text"] as? Bool{
                            if let isUnlimitedTalk = attributes["unlimited-talk"] as? Bool{
                                if let isUnlimitedIntlText = attributes["unlimited-international-text"] as? Bool{
                                    if let isUnlimitedIntlTalk = attributes["unlimited-international-talk"] as? Bool{
                                        if let price = attributes ["price"] as? Int{
                                            guard let product = Products.init(id: id, name: name, includedData: includedData, isUnlimitedText: isUnlimitedText, isUnlimitedTalk: isUnlimitedTalk,isUnlimitedInternationalText: isUnlimitedIntlText, isUnlimitedInternationalTalk: isUnlimitedIntlTalk, price: price) as Products? else { return nil}
                                            print("\(product)")
                                            return product
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return nil
}
