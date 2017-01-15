//
//  LunchScreenViewController.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import UIKit

class LunchScreenViewController: UIViewController {
    
    @IBOutlet var theLogoImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //        let server = Constants.ServerInformation.ServerUrl
        let server = Constants.ServerInformation.ServerUrlFromMobile
        
        
        
        //        **************** Getting from String ***************
        
        //        let string = "{\"data\":{\"type\":\"accounts\",\"id\":\"2593177\",\"attributes\":{\"payment-type\":\"prepaid\",\"unbilled-charges\":null,\"next-billing-date\":null,\"title\":\"Ms\",\"first-name\":\"Joe\",\"last-name\":\"Bloggs\",\"date-of-birth\":\"1985-01-01\",\"contact-number\":\"0404000000\",\"email-address\":\"test@amaysim.com\",\"email-address-verified\":false,\"email-subscription-status\":false},\"links\":{\"self\":\"http://localhost:3000/accounts/2593177\"},\"relationships\":{\"services\":{\"links\":{\"related\":\"http://localhost:3000/services/0468874507\"}}}},\"included\":[{\"type\":\"services\",\"id\":\"0468874507\",\"attributes\":{\"msn\":\"0468874507\",\"credit\":1200,\"credit-expiry\":\"2016-11-20\",\"data-usage-threshold\":false},\"links\":{\"self\":\"http://localhost:3000/services/0468874507\"},\"relationships\":{\"subscriptions\":{\"links\":{\"related\":\"http://localhost:3000/services/0468874507/subscriptions\"},\"data\":[{\"type\":\"subscriptions\",\"id\":\"0468874507-0\"}]}}},{\"type\":\"subscriptions\",\"id\":\"0468874507-0\",\"attributes\":{\"included-data-balance\":52400,\"included-credit-balance\":null,\"included-rollover-credit-balance\":null,\"included-rollover-data-balance\":null,\"included-international-talk-balance\":null,\"expiry-date\":\"2016-11-19\",\"auto-renewal\":true,\"primary-subscription\":true},\"links\":{\"self\":\"http://localhost:3000/services/0468874507/subscriptions/0468874507-0\"},\"relationships\":{\"service\":{\"links\":{\"related\":\"http://localhost:3000/services/0468874507\"}},\"product\":{\"data\":{\"type\":\"products\",\"id\":\"0\"}},\"downgrade\":{\"data\":null}}},{\"type\":\"products\",\"id\":\"4000\",\"attributes\":{\"name\":\"UNLIMITED 7GB\",\"included-data\":null,\"included-credit\":null,\"included-international-talk\":null,\"unlimited-text\":true,\"unlimited-talk\":true,\"unlimited-international-text\":false,\"unlimited-international-talk\":false,\"price\":3990}}]}"
        //
        //        print(string.convertToDictionary)
        //        let json = string.convertToDictionary
        //        if AMTranslate(json: json!) == true {
        //            let singleton = Accounts.sharedInstance
        //            print("\(singleton.relatedServices?[0])")
        //        }
        //
        
        
        
        
        
        
        
        
        //        **************** Getting from String response ***************
        
        //
        //        URLSession.shared.dataTask(with: Constants.ServerInformation.ServerUrl!, completionHandler: {(data, response, error) in
        //            guard let data = data, error == nil else { return }
        //            print(String(data: data, encoding: .utf8) ?? "")
        //            if let json = String(data:data, encoding: .utf8)?.convertToDictionary {
        //                if AMTranslate(json: json) == true {print("\(Accounts.sharedInstance)")}
        //            }
        //
        //        }).resume()
        //
        
        
        
        
        //        **************** Getting from json response ***************
        
        URLSession.shared.dataTask(with: server!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            if let json = data.convertToDictionary {
                if AMTranslate(json: json) == true {
                    DispatchQueue.main.async {
                        UIView.animate(withDuration: 2, delay: 1, options: UIViewAnimationOptions.curveEaseInOut, animations: { () -> Void in
                            self.theLogoImageView.center = CGPoint(x: self.theLogoImageView.center.x, y: 66 + (43 / 2))
                        }, completion: { (finished) -> Void in
                            self.performSegue(withIdentifier: "toLoginPageSegue", sender: self)
                        })
                    }
                }
            }
        }).resume()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    //     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}
