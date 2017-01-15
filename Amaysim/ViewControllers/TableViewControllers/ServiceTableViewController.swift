//
//  ServiceTableViewController.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import UIKit

class ServiceTableViewController: UITableViewController {
        
        
        let account =                           Accounts.sharedInstance
        var service:                            Services!

        let keys =                              ["id", "MSN", "credit", "creditExpiryDate", "relatedSubscriptions"]
        var members:                            [String: String] = [:]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            service = account.relatedServices?[0]
            let mirrored_object = Mirror(reflecting: service)
            
            for (index, attr) in mirrored_object.children.enumerated() {
                if let property_name = attr.label as String! {
                    members["\(property_name)"] = "\(attr.value)"
                    print("Attr \(index): \(property_name) = \(attr.value)")
                }
            }
            
            
            
            
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false
            
            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "serviceReuseIdentifier", for: indexPath)
            cell.textLabel?.text =                          keys[indexPath.row]
            if indexPath.row == keys.count - 1 {
                cell.detailTextLabel?.text =                service.relatedSubscriptions?[0].id
                cell.accessoryType =                        .disclosureIndicator
                cell.selectionStyle =                       .blue
                
            } else {
                cell.detailTextLabel?.text =                members[keys[indexPath.row]]
                cell.selectionStyle =                       .none
            }
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row == keys.count - 1 {
                self.performSegue(withIdentifier: "toSubscriptionTableVCSegue", sender: self)
            }
        }


    
}
