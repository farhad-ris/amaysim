//
//  JsonResponseTranslation.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 18/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import XCTest
@testable import Amaysim


class JsonResponseTranslation: XCTestCase {

    var json: [String:Any]?
    
    let productid:                                 String = randomString(length: 5)
    let productname:                               String = randomString(length: 12)
    let productincludedData:                       Int = randomInt(from: 0, to: 50000)
    let productincludedCredit:                     Int = randomInt(from: 0, to: 50000)
    let productincludedInternationalTalk:          Int = randomInt(from: 0, to: 50000)
    let productisUnlimitedText:                    Bool = randomBool()
    let productisUnlimitedTalk:                    Bool = randomBool()
    let productisUnlimitedInternationalText:       Bool = randomBool()
    let productisUnlimitedInternationalTalk:       Bool = randomBool()
    let productprice:                              Int = randomInt(from: 0, to: 50000)
    
    
    let subscriptionsid:                                                 String = randomString(length: 12)
    let subscriptionsincludedDataBalance:                                Int = randomInt(from: 0, to: 50000)
    let subscriptionsincludedCreditBalance:                              Int = randomInt(from: 0, to: 50000)
    let subscriptionsincludedRolloverDataBalance:                        Int = randomInt(from: 0, to: 50000)
    let subscriptionsincludedRolloverCreditBalance:                      Int = randomInt(from: 0, to: 50000)
    let subscriptionsincludedInternationalTalkBalance:                   Int = randomInt(from: 0, to: 50000)
    let subscriptionsexpiryDate:                                         String = "\(randomInt(from: 1970, to: 2016))-\(randomInt(from: 1, to: 12))-\(randomInt(from: 1, to: 28))"
    let subscriptionsisAutoRenewal:                                      Bool = randomBool()
    let subscriptionsisPrimarySubscription:                              Bool = randomBool()
    let subscriptionsURL:                                                String = randomString(length: 55)
    
    
    let servicesid:                                 String = randomString(length: 12)
    let servicesMSN:                                String = randomString(length: 12)
    let servicescredit:                             Int = randomInt(from: 0, to: 50000)
    let servicescreditExpiryDate:                   String = "\(randomInt(from: 1970, to: 2016))-\(randomInt(from: 1, to: 12))-\(randomInt(from: 1, to: 28))"
    let servicesisDataUsageThreshold:               Bool = randomBool()
    let servicesURL:                                String = randomString(length: 12)
    
    
    let accountsid:                             String = randomString(length: 12)
    let accountspaymentType:                    String = randomString(length: 12)
    let accountsunbilledCharges:                Int = randomInt(from: 0, to: 50000)
    let accountsnextBillingDate:                String = "\(randomInt(from: 1970, to: 2016))-\(randomInt(from: 1, to: 12))-\(randomInt(from: 1, to: 28))"
    let accountstitle:                          String = randomString(length: 12)
    let accountsfirstName:                      String = randomString(length: 12)
    let accountslastName:                       String = randomString(length: 12)
    let accountsdateOfBirth:                    String = "\(randomInt(from: 1970, to: 2016))-\(randomInt(from: 1, to: 12))-\(randomInt(from: 1, to: 28))"
    let accountscontactNumber:                  String = randomString(length: 12)
    let accountsemail:                          String = randomEmail()
    let accountsisEmailVerified:                Bool = randomBool()
    let accountsisSubscribedForEmail:           Bool = randomBool()
    let accountsURL:                            String = randomString(length: 12)
    
    
    override func setUp() {
        super.setUp()

        let string = "{\"data\":{\"type\":\"accounts\",\"id\":\"\(accountsid)\",\"attributes\":{\"payment-type\":\"\(accountspaymentType)\",\"unbilled-charges\":\(accountsunbilledCharges),\"next-billing-date\":\"\(accountsnextBillingDate)\",\"title\":\"\(accountstitle)\",\"first-name\":\"\(accountsfirstName)\",\"last-name\":\"\(accountslastName)\",\"date-of-birth\":\"\(accountsdateOfBirth)\",\"contact-number\":\"\(accountscontactNumber)\",\"email-address\":\"\(accountsemail)\",\"email-address-verified\":\(accountsisEmailVerified),\"email-subscription-status\":\(accountsisSubscribedForEmail)},\"links\":{\"self\":\"\(accountsURL)\"},\"relationships\":{\"services\":{\"links\":{\"related\":\"\(servicesURL)\"}}}},\"included\":[{\"type\":\"services\",\"id\":\"\(servicesid)\",\"attributes\":{\"msn\":\"\(servicesMSN)\",\"credit\":\(servicescredit),\"credit-expiry\":\"\(servicescreditExpiryDate)\",\"data-usage-threshold\":\(servicesisDataUsageThreshold)},\"links\":{\"self\":\"servicesURL\"},\"relationships\":{\"subscriptions\":{\"links\":{\"related\":\"\(subscriptionsURL)\"},\"data\":[{\"type\":\"subscriptions\",\"id\":\"\(subscriptionsid)\"}]}}},{\"type\":\"subscriptions\",\"id\":\"\(subscriptionsid)\",\"attributes\":{\"included-data-balance\":\(subscriptionsincludedDataBalance),\"included-credit-balance\":\(subscriptionsincludedCreditBalance),\"included-rollover-credit-balance\":\(subscriptionsincludedRolloverCreditBalance),\"included-rollover-data-balance\":\(subscriptionsincludedRolloverDataBalance),\"included-international-talk-balance\":\(subscriptionsincludedInternationalTalkBalance),\"expiry-date\":\"\(subscriptionsexpiryDate)\",\"auto-renewal\":\(subscriptionsisAutoRenewal),\"primary-subscription\":\(subscriptionsisPrimarySubscription)},\"links\":{\"self\":\"\(subscriptionsURL)\"},\"relationships\":{\"service\":{\"links\":{\"related\":\"http://localhost:3000/services/0468874507\"}},\"product\":{\"data\":{\"type\":\"products\",\"id\":\"\(productid)\"}},\"downgrade\":{\"data\":null}}},{\"type\":\"products\",\"id\":\"\(productid)\",\"attributes\":{\"name\":\"\(productname)\",\"included-data\":\(productincludedData),\"included-credit\":\(productincludedCredit),\"included-international-talk\":\(productincludedInternationalTalk),\"unlimited-text\":\(productisUnlimitedText),\"unlimited-talk\":\(productisUnlimitedTalk),\"unlimited-international-text\":\(productisUnlimitedInternationalText),\"unlimited-international-talk\":\(productisUnlimitedInternationalTalk),\"price\":\(productprice)}}]}"
        
         self.json = string.convertToDictionary
    }
    
    func testPerformanceAMTranslate() {
        // This is an example of a performance test case.
        self.measure {
            _ = AMTranslate(json: self.json!)
        }
    }
    
    func testAMTranslate() {

        XCTAssertTrue(AMTranslate(json: json!))
        
        // This is a performance test case.
        self.measure {
            _ = AMTranslate(json: self.json!)
        }
        
        let account =                                                       Accounts.sharedInstance
        XCTAssertTrue(account.id ==                                         accountsid)
        XCTAssertTrue(account.paymentType ==                                accountspaymentType)
        XCTAssertTrue(account.title ==                                      accountstitle)
        XCTAssertTrue(account.firstName ==                                  accountsfirstName)
        XCTAssertTrue(account.lastName ==                                   accountslastName)
        XCTAssertTrue(account.dateOfBirth ==                                accountsdateOfBirth.AMDate)
        XCTAssertTrue(account.isEmailVerified ==                            accountsisEmailVerified)
        XCTAssertTrue(account.isSubscribedForEmail ==                       accountsisSubscribedForEmail)
        XCTAssertTrue(account.contactNumber ==                              accountscontactNumber)
        XCTAssertTrue(account.email ==                                      accountsemail)

        
        let service =                                           account.relatedServices?[0]
        XCTAssertTrue(service?.id ==                            servicesid)
        XCTAssertTrue(service?.MSN ==                           servicesMSN)
        XCTAssertTrue(service?.creditExpiryDate ==              servicescreditExpiryDate.AMDate)
        XCTAssertTrue(service?.credit ==                        servicescredit)
        XCTAssertTrue(service?.isDataUsageThreshold ==          servicesisDataUsageThreshold)
        
        
        let subscription =                                                  service?.relatedSubscriptions?[0]
        XCTAssertTrue(subscription?.id ==                                   subscriptionsid)
        XCTAssertTrue(subscription?.includedDataBalance ==                  subscriptionsincludedDataBalance)
        XCTAssertTrue(subscription?.expiryDate ==                           subscriptionsexpiryDate.AMDate)
        XCTAssertTrue(subscription?.isAutoRenewal ==                        subscriptionsisAutoRenewal)
        XCTAssertTrue(subscription?.isPrimarySubscription ==                subscriptionsisPrimarySubscription)
        XCTAssertTrue(subscription?.URL ==                                  subscriptionsURL)
        
        
        let product =                                                       subscription?.relatedProducts?[0]
        XCTAssertTrue(product?.id ==                                        productid)
        XCTAssertTrue(product?.name ==                                      productname)
        XCTAssertTrue(product?.includedData ==                              productincludedData)
        XCTAssertTrue(product?.isUnlimitedText ==                           productisUnlimitedText)
        XCTAssertTrue(product?.isUnlimitedTalk ==                           productisUnlimitedTalk)
        XCTAssertTrue(product?.isUnlimitedInternationalTalk ==              productisUnlimitedInternationalTalk)
        XCTAssertTrue(product?.isUnlimitedInternationalText ==              productisUnlimitedInternationalText)
        XCTAssertTrue(product?.price ==                                     productprice)
        
//        **************** this is to fail on porpose ***********************
//        XCTAssertTrue(product?.price == (productprice + 1), "the product?.price: \(product?.price) does not match productprice: \(productprice + 1) ")
  
    }
}
