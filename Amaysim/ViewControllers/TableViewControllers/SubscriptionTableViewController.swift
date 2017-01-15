//
//  SubscriptionTableViewController.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import UIKit

class SubscriptionTableViewController: UITableViewController {

    let account =                           Accounts.sharedInstance
    var subscription:                       Subscriptions!
    
    let keys =                              ["id", "includedDataBalance", "expiryDate", "isAutoRenewal", "isPrimarySubscription", "relatedProducts"]
    var members:                            [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscription = account.relatedServices?[0].relatedSubscriptions?[0]
        let mirrored_object = Mirror(reflecting: subscription)
        
        for (index, attr) in mirrored_object.children.enumerated() {
            if let property_name = attr.label as String! {
                members["\(property_name)"] = "\(attr.value)"
                print("Attr \(index): \(property_name) = \(attr.value)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return keys.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subscriptionReuseIdentifier", for: indexPath)
        cell.textLabel?.text =                          keys[indexPath.row]
        if indexPath.row == keys.count - 1 {
            cell.detailTextLabel?.text =                subscription.relatedProducts?[0].id
            cell.accessoryType =                        .disclosureIndicator
            cell.selectionStyle =                       .blue
        } else {
            cell.detailTextLabel?.text =                members[keys[indexPath.row]]
            cell.selectionStyle =                       .none
            if keys[indexPath.row] == "includedDataBalance" {
                cell.detailTextLabel?.text =             "\(subscription.includedDataBalance! / 1024)GB"
            }

        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == keys.count - 1 {
            self.performSegue(withIdentifier: "toProductTableVCSegue", sender: self)
        }
    }
    


}

